package br.edu.les2019.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Categoria;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.ReportCoursesSold;

public class ReportDAO extends AbstractDAO 
{	public ReportDAO()	{super();}

	@Override public void save(EntityDomain ed) 
	{	
	}

	@Override public void update(EntityDomain ed) 
	{	
	}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	List<EntityDomain> entidades = new ArrayList<>();
		ReportCoursesSold rcs = (ReportCoursesSold)ed;
		Categoria categoria = null;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
			
			this.ps = this.connection.prepareStatement(
				"SELECT COUNT(c.categoria) AS qtd, c.categoria AS categoria "
				+ "FROM course AS c INNER JOIN item AS i "
				+ "WHERE c.id = i.ite_cur_id "
				+ "AND i.registry BETWEEN ? AND ? "
				+ "GROUP BY c.categoria");
			
			this.ps.setDate(1, new java.sql.Date(rcs.getStartDate().getTime()));
			this.ps.setDate(2, new java.sql.Date(rcs.getEndDate().getTime()));
			
			this.rs = this.ps.executeQuery();
			
			rcs.setCategorias(new ArrayList<Categoria>());
			
			while(this.rs.next())
			{	categoria = new Categoria();
				categoria.setQtd(rs.getInt(1));
				categoria.setName(rs.getString(2));
				
				rcs.getCategorias().add(categoria);
			}
			
			CupomDAO cdao = new CupomDAO();
			cdao.ctrlTransaction = false;
			cdao.connection = this.connection;
			cdao.search2(rcs);
			
			SaleDAO sdao = new SaleDAO();
			sdao.ctrlTransaction = false;
			sdao.connection = this.connection;
			sdao.searchClientSale(rcs);
			
			CourseDAO codao = new CourseDAO();
			codao.ctrlTransaction = false;
			codao.connection = this.connection;
			codao.searchCursoCupom(rcs);
			
			entidades.add(rcs);
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
		return entidades;
	}

	@Override public List<EntityDomain> search() 
	{	return null;
	}

	@Override
	public void updateKey(EntityDomain ed) {
		// TODO Auto-generated method stub
		
	}
}