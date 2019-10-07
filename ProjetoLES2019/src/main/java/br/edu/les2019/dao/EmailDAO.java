package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;

public class EmailDAO extends AbstractDAO 
{	public EmailDAO() {super();}
	@Override public void save(EntityDomain ed) 
	{	Client client = (Client)ed;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("INSERT INTO email " + 
				"(ema_cli_id, adress) VALUES(?, ?)");
			this.ps.setInt(1, client.getId());
			this.ps.setString(2, client.getEmails().get(0));
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

	@Override public void update(EntityDomain ed) 
	{	Client client = (Client)ed;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("UPDATE email SET " + 
				"adress = ? WHERE ema_cli_id = ?");
			this.ps.setString(1, client.getEmails().get(0));
			this.ps.setInt(2, client.getId());
			this.ps.executeUpdate();
			this.connection.commit();
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {System.out.println(e1.getMessage());}
			e.printStackTrace();
		}
		finally
		{	try
			{	ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){System.out.println(e2.getMessage());}
		}
	}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	Client client = (Client)ed;
		List<EntityDomain> entities = new ArrayList<>();
		try
		{	this.ps = this.connection.prepareStatement("SELECT adress FROM " +
				"email WHERE ema_cli_id = ?");
			this.ps.setInt(1, client.getId());
			this.rs = this.ps.executeQuery();
			List<String> emails = new ArrayList<>();
			while(this.rs.next())
			{emails.add(this.rs.getString(3));}
			client.setEmails(emails);
			entities.add(client);
		}
		catch(Exception e)	{System.err.println(e.getMessage());}
		finally
		{	try
			{	ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
		return entities;
	}
	
	public List<String> searchEmail(EntityDomain ed)
	{	List<String> emails = new ArrayList<>();
		//Client client = (Client)ed;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.ps = this.connection.prepareStatement("SELECT adress FROM email WHERE ema_cli_id = ?");
			this.ps.setInt(1, ed.getId());
			this.rs = this.ps.executeQuery();
			while(this.rs.next())
			{emails.add(this.rs.getString("adress"));}
		}
		catch(Exception e)	{System.err.println(e.getMessage());}
		finally
		{	try
			{	this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){System.out.println(e2.getMessage());}
		}
		return emails;
	}

	@Override
	public List<EntityDomain> search() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void delete2(EntityDomain ed)
	{	Client client = (Client)ed;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("DELETE FROM email " +
				"WHERE ema_cli_id = ?");
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