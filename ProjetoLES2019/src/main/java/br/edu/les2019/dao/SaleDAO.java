package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.CursoVenda;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.Payment;
import br.edu.les2019.domain.ReportCoursesSold;
import br.edu.les2019.domain.Sale;

public class SaleDAO extends AbstractDAO 
{	public SaleDAO()	{super();}
	Sale sale = null;
	Item item = null;
	@Override public void save(EntityDomain ed) 
	{	this.sale = (Sale)ed;
		this.table = this.sale.getClass().getSimpleName();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
		
			this.ps = this.connection.prepareStatement("INSERT INTO " + this.table + 
				" (sal_cli_id, code, total, status) VALUES(?, ?, ?, ?)", 
				this.ps.RETURN_GENERATED_KEYS);
			
			this.ps.setInt(1, this.sale.getClient().getId());
			this.ps.setString(2, this.sale.getCode());
			this.ps.setDouble(3, this.sale.getTotal());
			this.ps.setString(4, this.sale.getSaleStatus());
			
			this.ps.executeUpdate();
			
			this.rs = this.ps.getGeneratedKeys();
			
			if(this.rs.next())	this.sale.setId(this.rs.getInt(1));
			
			ItemDAO idao = new ItemDAO();
			idao.ctrlTransaction = false;
			idao.connection = this.connection;
			for(EntityDomain e:this.sale.getListItem())
			{	this.item = (Item)e;
				this.item.setSale(this.sale);
				idao.save(this.item);
			}
			
			PayDAO pdao = new PayDAO();
			pdao.ctrlTransaction = false;
			pdao.connection = this.connection;
			this.sale.getPayment().setSale(sale);
			pdao.save(this.sale.getPayment());
			
			CarDAO cardao = new CarDAO();
			cardao.ctrlTransaction = false;
			cardao.connection = this.connection;
			cardao.deleteCourses(this.sale.getClient());
			
			this.connection.commit();
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {e1.printStackTrace();}
			e.printStackTrace();
		}
		finally
		{	try
			{	ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
	}

	@Override public void update(EntityDomain ed) 
	{	this.sale = (Sale)ed;
		this.table = this.sale.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
			
			this.ps = this.connection.prepareStatement("UPDATE " + this.table +
				" SET status = ? WHERE id = ?");
			
			this.ps.setString(1, this.sale.getSaleStatus());
			this.ps.setInt(2, this.sale.getId());
			
			this.ps.executeUpdate();
			
			ItemDAO idao = new ItemDAO();
			idao.connection = this.connection;
			idao.ctrlTransaction = false;
			idao.update(this.sale);
			
			this.connection.commit();
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {e1.printStackTrace();}
			e.printStackTrace();
		}
		finally
		{	try
			{	ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
	}
	
	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	List<EntityDomain> entities = new ArrayList<>();
		Client client = (Client)ed;
		Sale sale = null;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement("SELECT * FROM sale WHERE sal_cli_id = ?");
			
			this.ps.setInt(1, client.getId());
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	sale = new Sale();
				sale.setId(this.rs.getInt(1));
				sale.setClient(client);
				sale.getClient().setId(this.rs.getInt(2));
				sale.setCode(this.rs.getString(3));
				sale.setTotal(this.rs.getDouble(4));
				sale.setSaleStatus(this.rs.getString(5));
				sale.setRegistry(new java.sql.Date(this.rs.getDate(6).getTime()));
				
				ItemDAO idao = new ItemDAO();
				idao.ctrlTransaction = false;
				idao.connection = this.connection;
				sale.setListItem(new ArrayList<Item>());
				for(EntityDomain edo:idao.search(sale))
				{	if(edo != null)
					{	Item item = (Item)edo;
						CourseDAO cdao = new CourseDAO();
						cdao.ctrlTransaction = false;
						cdao.connection = this.connection;
						for(EntityDomain edo2:cdao.search())
						{	if(edo2 != null)
							{	Course course = (Course)edo2;
								if(item.getCourse().getId() == course.getId())
								{	item.setCourse(course);
									sale.getListItem().add(item);
									break;
								}
							}
						}
					}
				}
				entities.add(sale);
			}
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			e.printStackTrace();
		}
		finally
		{	try
			{	ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
		return entities;
	}

	@Override public List<EntityDomain> search() 
	{return null;}
	
	public void searchClientSale(ReportCoursesSold rcs)
	{	CursoVenda cv = null;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement(
				"SELECT i.registry AS tempo, "
				+ "SUM(i.preco) AS venda, SUM(c.valor) AS custo "
				+ "FROM item AS i JOIN course AS c "
				+ "WHERE i.ite_cur_id = c.id AND i.registry "
				+ "BETWEEN ? AND ? "
				+ "GROUP BY CONCAT(YEAR(i.registry), '-', MONTH(i.registry)) "
				+ "ORDER BY i.registry");
			
			this.ps.setDate(1, new java.sql.Date(rcs.getStartDate().getTime()));
			this.ps.setDate(2, new java.sql.Date(rcs.getEndDate().getTime()));
			
			this.rs = this.ps.executeQuery();
			rcs.setVendas(new ArrayList<>());
			while(this.rs.next())
			{	cv = new CursoVenda();
				cv.setRegistry(new java.sql.Date(this.rs.getDate(1).getTime()));
				cv.setTotalVenda(this.rs.getDouble(2));
				cv.setTotalCurso(this.rs.getDouble(3));
				rcs.getVendas().add(cv);
			}
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			e.printStackTrace();
		}
		finally
		{	try
			{	ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
	}

	@Override
	public void updateKey(EntityDomain ed) {
		// TODO Auto-generated method stub
		
	}
}