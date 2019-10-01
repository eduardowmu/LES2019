package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;

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
				" (code, ite_cur_id, ite_sal_id) VALUES(?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
			
			this.ps.setString(1, item.getCode());
			this.ps.setInt(2, item.getCourse().getId());
			this.ps.setInt(3, item.getSale().getId());
			
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

	@Override
	public void update(EntityDomain ed) {
		// TODO Auto-generated method stub

	}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	List<EntityDomain> itens = new ArrayList<>();
		if(ed instanceof Client)
		{	this.item = new Item();
			this.item.setClient((Client)ed);
		}
		else this.item = (Item)ed;
		Item it = null;
		this.table = item.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement("SELECT * FROM " +
					this.table + " WHERE ite_alu_id = ?");
			
			this.ps.setInt(1, item.getClient().getId());
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	it = new Item();
			//System.out.println(this.rs.getInt(1));
				it.setId(this.rs.getInt(1));
				it.setClient(new Client());
				it.getClient().setId(2);
				it.setCourse(new Course());
				it.getCourse().setId(3);
				itens.add(it);
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
	public List<EntityDomain> search() {
		// TODO Auto-generated method stub
		return null;
	}
}
