package br.edu.les2019.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import br.edu.les2019.domain.EntityDomain;

public abstract class AbstractDAO implements IDAO 
{	Connection connection;
	PreparedStatement ps;
	ResultSet rs;
	boolean ctrlTransaction;
	String server;
	String user;
	String password;
	String database;
	String table;
	String path;
	
	public AbstractDAO()
	{	this.server = "localhost:3306";
		this.user = "root";
		this.password = "";
		this.database = "fatec2019";
		this.path = "jdbc:mysql://"+ this.server +"/"+ this.database;
		this.ctrlTransaction = true;
		/*
		try
		{	Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager.getConnection(this.path, this.user, this.password);
			this.connection.setAutoCommit(false);
		}
		catch(SQLException | ClassNotFoundException e)
		{System.out.println(e.getMessage());}*/
	}
	
	@Override public void delete(EntityDomain ed)
	{	this.table = ed.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("DELETE FROM " +
				this.table + " WHERE id = ?");	
			//this.ps.setInt(1, ed.getId());
			this.ps.setInt(1, ed.getId());
			this.ps.executeUpdate();
			this.connection.commit();
		}
		catch(SQLException e)
		{	System.out.println(e.getMessage());
			try {connection.rollback();}
			catch(SQLException  e1) {System.out.println(e1.getMessage());}
		}
		finally
		{	try
			{	ps.close();
				if(this.ctrlTransaction) 
					connection.close();
			}
			catch(SQLException e) {e.printStackTrace();}
		}
	}
	public Connection getConnection()
	{	this.server = "localhost:3306";
		this.user = "root";
		this.password = "";
		this.database = "fatec2019";
		this.path = "jdbc:mysql://"+ this.server +"/"+ this.database;
		this.ctrlTransaction = true;
		try
		{	Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager.getConnection(this.path, this.user, this.password);
		}
		catch(SQLException | ClassNotFoundException e)
		{System.out.println(e.getMessage());}
		return this.connection;
	}
}
