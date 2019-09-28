package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Phone;

public class PhoneDAO extends AbstractDAO 
{	@Override public void save(EntityDomain ed) 
	{	Phone phone = (Phone)ed;
		this.table = phone.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("INSERT INTO " +
				this.table + "(pho_cli_id, number, ddd, type)VALUES(?, ?, ?, ?)",
				this.ps.RETURN_GENERATED_KEYS);
			this.ps.setInt(1, phone.getClient().getId());
			this.ps.setString(2, phone.getNumber());
			this.ps.setString(3, phone.getDdd());
			this.ps.setString(4, phone.getType());
			this.ps.executeUpdate();
			this.rs = this.ps.getGeneratedKeys();
			if(this.rs.next())	{phone.setId(this.rs.getInt(1));}
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
	{	Phone phone = (Phone)ed;
		this.table = phone.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("UPDATE " +
				this.table + " SET number = ?, ddd = ?, type = ? WHERE pho_cli_id = ?");
			this.ps.setString(1, phone.getNumber());
			this.ps.setString(2, phone.getDdd());
			this.ps.setString(3, phone.getType());
			this.ps.setInt(4, phone.getClient().getId());
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
	{	Client client = (Client)ed;
		Phone phone = null;
		List<EntityDomain> entities = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.ps = this.connection.prepareStatement(
				"SELECT * FROM phone WHERE pho_cli_id = ?");
			this.ps.setInt(1, client.getId());
			this.rs = this.ps.executeQuery();
			while(this.rs.next())
			{	phone = new Phone();
				phone.setDdd(this.rs.getString("ddd"));
				phone.setNumber(this.rs.getString("number"));
				phone.setType(this.rs.getString("type"));
				entities.add(phone);
			}
		}
		catch(SQLException e)	{System.out.println(e.getMessage());}
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
	{
		// TODO Auto-generated method stub
		return null;
	}
	
	public void delete2(EntityDomain ed)
	{	Client client = (Client)ed;
		try
		{	this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("DELETE FROM phone " +
				"WHERE pho_cli_id = ?");
			this.ps.setInt(1, client.getId());
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
}