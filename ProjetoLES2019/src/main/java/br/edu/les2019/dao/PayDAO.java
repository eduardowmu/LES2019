package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Payment;
import br.edu.les2019.domain.Sale;

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
			
			for(int i = 0; i < this.payment.getClient().getCards().size(); i++)
			{	if(this.payment.getPaymap().get(this.payment.getClient().getCards().get(i)) != null)
				{	this.ps = this.connection.prepareStatement("INSERT INTO " +
						this.table + " (pay_sal_id, pay_car_id, parcelas, total, status)" +
						" VALUES(?, ?, ?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
					
					this.ps.setInt(1, this.payment.getSale().getId());
					this.ps.setInt(2, this.payment.getClient().getCards().get(i).getId());
					this.ps.setInt(3, this.payment.getQtdParcelas());
					this.ps.setDouble(4, this.payment.getPaymap().get(this.payment.getClient().getCards().get(i)));
					this.ps.setString(5, "pendente");
					
					this.ps.executeUpdate();
					
					this.rs = this.ps.getGeneratedKeys();
					
					if(this.rs.next())	this.payment.setId(this.rs.getInt(1));
				}
			}
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
	{
	}

	@Override public List<EntityDomain> search(EntityDomain ed)
	{	Sale sale = (Sale)ed;
		List<EntityDomain> entities = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement(
				"SELECT * FROM payment WHERE pay_sal_id = ?");
			
			this.ps.setInt(1, sale.getId());
			
			this.rs = this.ps.executeQuery();
			int i = 0;
			while(this.rs.next())
			{	Payment pay = new Payment();
				pay.setId(this.rs.getInt("id"));
				pay.setSale(sale);
				pay.setQtdParcelas(this.rs.getInt("parcelas"));
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
	{	return null;
	}

	@Override
	public void updateKey(EntityDomain ed) {
		// TODO Auto-generated method stub
		
	}
}