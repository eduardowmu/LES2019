package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.CupomStatus;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.ReportCoursesSold;

public class CupomDAO extends AbstractDAO 
{	Cupom cupom;
	boolean salvou;
	public CupomDAO()	
	{	super();
		this.salvou = false;
	} //construtor
	@Override public void save(EntityDomain ed) 
	{	this.cupom = (Cupom)ed;
		this.table = this.cupom.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
			
			this.ps = this.connection.prepareStatement("INSERT INTO " +
				this.table + " (cup_cli_id, cup_ite_id, codigo, tipo, valor, motivo, status, registry)"
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
			
			this.ps.setInt(1, this.cupom.getClient().getId());
			this.ps.setInt(2, this.cupom.getItem().getId());
			this.ps.setString(3, this.cupom.getCodigo());
			this.ps.setString(4, this.cupom.getTipo());
			this.ps.setDouble(5, this.cupom.getValue());
			this.ps.setString(6, this.cupom.getMotivo().getText());
			this.ps.setString(7, this.cupom.getStatus());
			this.ps.setDate(8, new java.sql.Date(System.currentTimeMillis()));
			
			this.ps.executeUpdate();
			
			this.rs = this.ps.getGeneratedKeys();
			
			if(this.rs.next())	this.cupom.setId(this.rs.getInt(1));
			
			this.connection.commit();
			this.salvou = true;
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
	{	this.cupom = (Cupom)ed;
		this.table = this.cupom.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
		
			this.ps = this.connection.prepareStatement("UPDATE " + this.table +
				" SET status = ? WHERE cup_cli_id = ? AND codigo = ?");
			
			this.ps.setString(1, this.cupom.getStatus());
			this.ps.setInt(2, this.cupom.getClient().getId());
			this.ps.setString(3, this.cupom.getCodigo());
			
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
	{	List<EntityDomain> entities = new ArrayList<>();
		Client client = (Client)ed;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement(
				"SELECT cup_ite_id, codigo, tipo, valor, status FROM cupom WHERE " +
				"cup_cli_id = ?");
			
			this.ps.setInt(1, ed.getId());
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	this.cupom = new Cupom();
				this.cupom.setItem(new Item());
				this.cupom.getItem().setId(this.rs.getInt(1));
				this.cupom.setCodigo(this.rs.getString(2));
				this.cupom.setTipo(this.rs.getString(3));
				this.cupom.setValue(this.rs.getDouble(4));
				this.cupom.setStatus(this.rs.getString(5));
				entities.add(this.cupom);
			}
		}
		catch(SQLException e)	{System.err.println(e.getMessage());}
		finally
		{	try
			{	//this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
		return entities;
	}
	
	@Override public List<EntityDomain> search() 
	{	return null;
	}
	
	public void search2(ReportCoursesSold rcs)
	{	CupomStatus cs = null;
		try
		{	if(this.connection != null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement(
				"SELECT COUNT(id) AS qtd, status FROM cupom WHERE registry "
				+ "BETWEEN ? AND ? GROUP BY status");
			
			this.ps.setDate(1, new java.sql.Date(rcs.getStartDate().getTime()));
			this.ps.setDate(2, new java.sql.Date(rcs.getEndDate().getTime()));
			
			this.rs = this.ps.executeQuery();
			rcs.setCupons(new ArrayList<>());
			while(this.rs.next())
			{	cs = new CupomStatus();
				cs.setQtd(this.rs.getInt(1));
				cs.setStatus(this.rs.getString(2));
				rcs.getCupons().add(cs);
			}
		}
		catch(SQLException e)	{System.err.println(e.getMessage());}
		finally
		{	try
			{	//this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
	}
	
	public boolean isSalvou() {return salvou;}
	public void setSalvou(boolean salvou) {this.salvou = salvou;}
}