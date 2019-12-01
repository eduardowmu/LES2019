package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.Motivo;
import br.edu.les2019.domain.Sale;

public class SaleCupomDAO extends AbstractDAO 
{	@Override public void save(EntityDomain ed) 
	{	Cupom cupom = (Cupom)ed;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
			
			this.ps = this.connection.prepareStatement("INSERT INTO scupom "
				+ "(scu_cli_id, scu_sal_id, codigo, tipo, valor, motivo, status) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
			
			this.ps.setInt(1, cupom.getClient().getId());
			this.ps.setInt(2, cupom.getSale().getId());
			this.ps.setString(3, cupom.getCodigo());
			this.ps.setString(4, cupom.getTipo());
			this.ps.setDouble(5, cupom.getValue());
			this.ps.setString(6, cupom.getMotivo().getText());
			this.ps.setString(7, cupom.getStatus());
			
			this.ps.executeUpdate();
			
			this.rs = this.ps.getGeneratedKeys();
			
			if(this.rs.next()) cupom.setId(this.rs.getInt(1));
			
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
	{}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	Client client = (Client)ed;
		List<EntityDomain> entities = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.ps = this.connection.prepareStatement(
				"SELECT * FROM scupom WHERE scu_cli_id = ?");
			
			this.ps.setInt(1, client.getId());
			
			this.rs = this.ps.executeQuery();
			while(this.rs.next())
			{	Cupom cupom = new Cupom();
				cupom.setId(this.rs.getInt(1));
				cupom.setClient(client);
				cupom.setSale(new Sale());
				cupom.getSale().setId(this.rs.getInt(3));
				cupom.setCodigo(this.rs.getString(4));
				cupom.setTipo(this.rs.getString(5));
				cupom.setValue(this.rs.getDouble(6));
				cupom.setMotivo(new Motivo(this.rs.getString(7)));
				cupom.setStatus(this.rs.getString(8));
				cupom.setRegistry(new java.sql.Date(this.rs.getDate(9).getTime()));
				entities.add(cupom);
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

	@Override public void updateKey(EntityDomain ed) 
	{}
	
	public List<Item> searchItens(Cupom cupom)
	{	List<Item> itens = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement(
				"SELECT c.cup_ite_id "
				+ "FROM cupom AS c "
				+ "INNER JOIN sale AS s "
				+ "INNER JOIN item AS i "
				+ "WHERE i.ite_sal_id = ? "
				+ "AND i.id = c.cup_ite_id");
			
			this.ps.setInt(1, cupom.getSale().getId());
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	Item item = new Item();
				item.setId(this.rs.getInt(1));
				itens.add(item);
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
		return itens;
	}
}