package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.List;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Payment;

public class PayDAO extends AbstractDAO 
{	public PayDAO()	{super();}
	Payment payment = null;
	@Override public void save(EntityDomain ed) 
	{	this.payment = (Payment)ed;
		this.table = this.payment.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
			
			for(int i = 0; i < this.payment.getPaymap().size(); i++)
			{	this.ps = this.connection.prepareStatement("INSERT INTO " +
					this.table + " (pay_sal_id, pay_car_id, total, status)" +
					" VALUES(?, ?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
				
				this.ps.setInt(1, this.payment.getSale().getId());
				this.ps.setInt(2, this.payment.getClient().getCards().get(i).getId());
				this.ps.setDouble(3, this.payment.getPaymap().get(this.payment.getClient().getCards().get(i)));
				this.ps.setString(4, "pendente");
				
				this.ps.executeUpdate();
				
				this.rs = this.ps.getGeneratedKeys();
				
				if(this.rs.next())	this.payment.setId(this.rs.getInt(1));
				
				this.connection.commit();
			}
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
	{
	}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	
		return null;
	}

	@Override public List<EntityDomain> search() 
	{	return null;
	}
}