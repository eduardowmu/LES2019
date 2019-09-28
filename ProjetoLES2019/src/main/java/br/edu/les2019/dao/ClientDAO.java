package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Phone;

public class ClientDAO extends AbstractDAO
{	Client client;
	//define o nome da tabela
	String table;
	public ClientDAO() {super();}

	@Override public void save(EntityDomain ed) 
	{	this.client = (Client)ed;
		this.table = this.client.getClass().getSimpleName().toLowerCase();
		try //código SQL para inserção de dados
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}	
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("INSERT INTO " + 
				this.table + "(name, surname, nascimento, cpf, genero, password, cadastro) " + 
				"VALUES(?, ?, ?, ?, ?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
			
			//prepara os dados a serem armazenados no BD
			this.ps.setString(1, this.client.getName());
			this.ps.setString(2, this.client.getSurname());
			this.ps.setDate(3, new java.sql.Date(this.client.getBirthday().getTime()));
			this.ps.setString(4, this.client.getCpf());
			this.ps.setString(5, this.client.getGenero());
			this.ps.setString(6, this.client.getPassword());
			this.ps.setDate(7, new java.sql.Date(System.currentTimeMillis()));
			//this.ps.setString(6, this.client.getPhoto());
			
			this.ps.executeUpdate();
			
			//para gerar a chave primária
			this.rs = this.ps.getGeneratedKeys();
			if(this.rs.next())	{this.client.setId(this.rs.getInt(1));}
			
			//salva os e-mails
			EmailDAO edao = new EmailDAO();
			edao.ctrlTransaction = false;
			edao.connection = this.connection;
			edao.save(this.client);
			
			//save all client's phones number
			PhoneDAO pdao = new PhoneDAO();
			//define the client of the phone as the same
			client.getPhone().setClient(client);
			pdao.ctrlTransaction = false;
			pdao.connection = this.connection;
			pdao.save(this.client.getPhone());
			
			//save all credit card
			CardDAO carDAO = new CardDAO();
			carDAO.ctrlTransaction = false;
			carDAO.connection = this.connection;
			for(CreditCard card:this.client.getCards())
			{carDAO.save(card);}
			//carDAO.save(client.getCard());
			
			//confirma a query
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
	{	this.client = (Client)ed;
		this.table = this.client.getClass().getSimpleName().toLowerCase();
		try //código SQL para inserção de dados
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("UPDATE " + 
				this.table + " SET name = ?, surname = ?, nascimento = ?, cpf = ?, genero = ? " + 
				"WHERE id = ?");
			
			//prepara os dados a serem armazenados no BD
			this.ps.setString(1, this.client.getName());
			this.ps.setString(2, this.client.getSurname());
			this.ps.setDate(3, new java.sql.Date(this.client.getBirthday().getTime()));
			this.ps.setString(4, this.client.getCpf());
			this.ps.setString(5, this.client.getGenero());
			this.ps.setInt(6, this.client.getId());
			//this.ps.setString(6, this.client.getPhoto());
			
			this.ps.executeUpdate();
			
			//salva os e-mails
			EmailDAO edao = new EmailDAO();
			edao.ctrlTransaction = false;
			edao.connection = this.connection;
			edao.update(this.client);
			
			//save all client's phones number
			PhoneDAO pdao = new PhoneDAO();
			//define the client of the phone as the same
			client.getPhone().setClient(client);
			pdao.ctrlTransaction = false;
			pdao.connection = this.connection;
			this.client.getPhone().setClient(client);
			pdao.update(this.client.getPhone());
			
			//save all credit card
			CardDAO carDAO = new CardDAO();
			carDAO.ctrlTransaction = false;
			carDAO.connection = this.connection;
			for(CreditCard card:this.client.getCards())
			{carDAO.update(card);}
			/*this.client.getCard().setClient(client);
			carDAO.update(client.getCard());*/
			
			//confirma a query
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
	{	this.client = (Client)ed;
		Client cli = null;
		this.table = this.client.getClass().getSimpleName().toLowerCase();
		List<EntityDomain> entities = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
				this.connection = this.getConnection();
			
			this.ps = this.connection.prepareStatement("SELECT * FROM " + 
				this.table + " WHERE id = ? OR name LIKE ? OR surname LIKE ?");
			
			this.ps.setInt(1, this.client.getId());
			
			if(this.client.getName().equals(""))
			{this.ps.setString(2, this.client.getName());}
			
			else this.ps.setString(2, this.client.getName() + "%");
			
			if(this.client.getSurname().equals(""))
			{this.ps.setString(3, this.client.getSurname());}
			
			else this.ps.setString(3, this.client.getSurname() + "%");
			
			this.rs = this.ps.executeQuery();
			while(this.rs.next())
			{	cli = new Client();
				cli.setId(this.rs.getInt(1));
				cli.setName(this.rs.getString(2));
				cli.setSurname(this.rs.getString(3));
				cli.setBirthday(this.rs.getDate(4));
				cli.setCpf(this.rs.getString(5));
				cli.setGenero(this.rs.getString(6));
				EmailDAO edao = new EmailDAO();
				edao.ctrlTransaction = false;
				edao.connection = this.connection;
				for(String email:edao.searchEmail(cli))
				{	cli.setEmails(new ArrayList<String>());
					cli.getEmails().add(email);
				}
				//get all client's phones number
				PhoneDAO pdao = new PhoneDAO();
				pdao.ctrlTransaction = false;
				pdao.connection = this.connection;
				for(EntityDomain entity:pdao.search(cli))
				{	if(entity != null)
					{	Phone phone = (Phone)entity;
						cli.setPhone(phone);
					}
				}
				//get all credit card
				CardDAO carDAO = new CardDAO();
				carDAO.ctrlTransaction = false;
				carDAO.connection = this.connection;
				for(EntityDomain entity2:carDAO.search(this.client))
				{	if(entity2 != null)
					{	CreditCard card = (CreditCard)entity2;
						cli.setCards(new ArrayList<>());
						cli.getCards().add(card);
					}
				}
				entities.add(cli);
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
	{	List<EntityDomain> entities = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.ps = this.connection.prepareStatement("SELECT * FROM client");
		
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	this.client = new Client();
				this.client.setId(this.rs.getInt(1));
				this.client.setName(this.rs.getString(2));
				this.client.setSurname(this.rs.getString(3));
				this.client.setBirthday(this.rs.getDate(4));
				this.client.setCpf(this.rs.getString(5));
				this.client.setGenero(this.rs.getString(6));
				this.client.setPassword(this.rs.getString(7));
				EmailDAO edao = new EmailDAO();
				edao.ctrlTransaction = false;
				edao.connection = this.connection;
				for(String email:edao.searchEmail(this.client))
				{	this.client.setEmails(new ArrayList<String>());
					this.client.getEmails().add(email);
				}
				//get all client's phones number
				PhoneDAO pdao = new PhoneDAO();
				pdao.ctrlTransaction = false;
				pdao.connection = this.connection;
				for(EntityDomain entity:pdao.search(this.client))
				{	if(entity != null)
					{	Phone phone = (Phone)entity;
						this.client.setPhone(phone);
					}
				}
				//get all credit card
				CardDAO carDAO = new CardDAO();
				carDAO.ctrlTransaction = false;
				carDAO.connection = this.connection;
				for(EntityDomain entity2:carDAO.search(this.client))
				{	if(entity2 != null)
					{	CreditCard card = (CreditCard)entity2;
						this.client.setCards(new ArrayList<>());
						this.client.getCards().add(card);
					}
				}
				entities.add(this.client);
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
}
