package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.Sale;

public class ItemDAO extends AbstractDAO 
{	String table;
	Item item;
	public ItemDAO() {super();}
	@Override public void save(EntityDomain ed) 
	{	item = (Item)ed;
		this.table = item.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
		
			this.ps = this.connection.prepareStatement("INSERT INTO " + this.table +
				" (code, ite_cur_id, ite_sal_id, status) VALUES(?, ?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
			
			this.ps.setString(1, item.getCode());
			this.ps.setInt(2, item.getCourse().getId());
			this.ps.setInt(3, item.getSale().getId());
			this.ps.setString(4, item.getStatus());
			
			this.ps.executeUpdate();
			
			this.rs = this.ps.getGeneratedKeys();
			
			if(this.rs.next())	item.setId(this.rs.getInt(1));
			
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
	{	Sale sale = null;
		Item item = null;
		if(ed instanceof Sale)	{sale = (Sale)ed;}
		else item = (Item)ed;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
			
			if(sale != null)
			{	this.ps = this.connection.prepareStatement("UPDATE item SET status = ? " +
					"WHERE ite_sal_id = ?");
			
				this.ps.setString(1, sale.getListItem().get(0).getStatus());
				this.ps.setInt(2, sale.getId());
			}
			
			else
			{	this.ps = this.connection.prepareStatement("UPDATE item SET status = ? " +
					"WHERE id = ?");
			
				this.ps.setString(1, item.getStatus());
				this.ps.setInt(2, item.getId());
			}
			
			this.ps.executeUpdate();
			
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
	{	List<EntityDomain> itens = new ArrayList<>();
		Sale sale = (Sale)ed;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement("SELECT * FROM item WHERE ite_sal_id = ?");
			
			this.ps.setInt(1, sale.getId());
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	this.item = new Item();
				this.item.setId(this.rs.getInt("id"));
				this.item.setCode(this.rs.getString("code"));
				this.item.setCourse(new Course());
				this.item.getCourse().setId(this.rs.getInt("ite_cur_id"));
				this.item.setSale(new Sale());
				this.item.getSale().setId(this.rs.getInt("ite_sal_id"));
				this.item.setStatus(this.rs.getString("status"));
				this.item.setRegistry(new java.sql.Date(this.rs.getDate("registry").getTime()));
				itens.add(this.item);
			}
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			e.printStackTrace();
		}
		finally
		{	try
			{	this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
		return itens;
	}

	@Override public List<EntityDomain> search() 
	{	List<EntityDomain> itens = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement("SELECT * FROM item");
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	this.item = new Item();
				this.item.setId(this.rs.getInt(1));
				this.item.setCode(this.rs.getString(2));
				this.item.setCourse(new Course());
				this.item.getCourse().setId(this.rs.getInt(3));
				this.item.setSale(new Sale());
				this.item.getSale().setId(this.rs.getInt(4));
				this.item.setStatus(this.rs.getString("status"));
				this.item.setRegistry(new java.sql.Date(this.rs.getDate(5).getTime()));
				itens.add(this.item);
			}
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			e.printStackTrace();
		}
		finally
		{	try
			{	this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
		return itens;
	}
	@Override
	public void updateKey(EntityDomain ed) {
		// TODO Auto-generated method stub
		
	}
}