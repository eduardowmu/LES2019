package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.List;

import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.Payment;
import br.edu.les2019.domain.Sale;

public class SaleDAO extends AbstractDAO 
{	public SaleDAO()	{super();}
	Sale sale = null;
	Item item = null;
	@Override public void save(EntityDomain ed) 
	{	this.sale = (Sale)ed;
		this.table = this.sale.getClass().getSimpleName();
		try
		{	if(this.connection == null || !this.connection.isClosed())
			{this.connection = this.getConnection();}
		
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
	{	
	}
	
	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	return null;
	}

	@Override public List<EntityDomain> search() 
	{	return null;
	}
}