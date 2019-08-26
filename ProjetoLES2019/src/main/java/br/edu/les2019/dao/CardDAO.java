package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Phone;

public class CardDAO extends AbstractDAO
{	CreditCard card;
	@Override public void save(EntityDomain ed) 
	{	card = (CreditCard)ed;
		this.table = card.getClass().getSimpleName().toLowerCase();
		try
		{	this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("INSERT INTO " + 
				this.table + "(car_cli_id, name, number, banner, code) " + 
				"VALUES(?, ?, ?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
			this.ps.setInt(1, card.getClient().getId());
			this.ps.setString(2, card.getName());
			this.ps.setString(3, card.getNumber());
			this.ps.setString(4, card.getBanner());
			this.ps.setString(5, card.getCode());
			this.ps.executeUpdate();
			this.rs = this.ps.getGeneratedKeys();
			if(this.rs.next()) card.setId(this.rs.getInt(1));
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
			catch(SQLException e2){System.out.println(e2.getMessage());}
		}
	}

	@Override public void update(EntityDomain ed)
	{	card = (CreditCard)ed;
		this.table = card.getClass().getSimpleName().toLowerCase();
		try
		{	this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("UPDATE " + 
				this.table + "(name = ?, number = ?, banner = ?, code = ? WHERE car_cli_id = ?)");
			this.ps.setString(1, card.getName());
			this.ps.setString(2, card.getNumber());
			this.ps.setString(3, card.getBanner());
			this.ps.setString(4, card.getCode());
			this.ps.setInt(5, card.getClient().getId());
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
			catch(SQLException e2){System.out.println(e2.getMessage());}
		}
	}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	Client client = (Client)ed;
		CreditCard cc = null;
		List<EntityDomain> entities = new ArrayList<>();
		try
		{	this.ps = this.connection.prepareStatement(
				"SELECT * FROM creditcard WHERE car_cli_id = ?");
			this.ps.setInt(1, client.getId());
			this.rs = this.ps.executeQuery();
			while(this.rs.next())
			{	cc = new CreditCard();
				cc.setName(this.rs.getString("name"));
				cc.setNumber(this.rs.getString("number"));
				cc.setBanner(this.rs.getString("banner"));
				cc.setCode(this.rs.getString("code"));
				entities.add(cc);
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

	@Override
	public List<EntityDomain> search() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void delete2(EntityDomain ed)
	{	Client client = (Client)ed;
		try
		{	this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("DELETE FROM creditcard " +
				"WHERE car_cli_id = ?");
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