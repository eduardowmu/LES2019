package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Ranking;

public class RankingDAO extends AbstractDAO 
{	@Override public void save(EntityDomain ed) 
	{}

	@Override public void update(EntityDomain ed) 
	{}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{return null;}

	@Override public List<EntityDomain> search() 
	{return null;}

	@Override public void updateKey(EntityDomain ed) 
	{}
	
	public Ranking searchRank(Ranking rank)
	{	try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement("SELECT cli.id, "
				+ "CONCAT(cli.name, ' ', cli.surname) AS cliente, SUM(sal.total) "
				+ "AS total FROM client AS cli JOIN sale AS sal WHERE cli.id = sal.sal_cli_id "
				+ "GROUP BY cli.id ORDER BY SUM(sal.total) DESC");
			
			this.rs = this.ps.executeQuery();
			
			rank.setCodes(new ArrayList<Integer>());
			rank.setClients(new ArrayList<String>());
			rank.setValues(new ArrayList<Double>());
			
			while(this.rs.next())
			{	rank.getCodes().add(this.rs.getInt(1));
				rank.getClients().add(this.rs.getString(2));
				rank.getValues().add(this.rs.getDouble(3));
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
		return rank;
	}
}