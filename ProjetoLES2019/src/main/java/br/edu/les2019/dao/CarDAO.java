package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.ShopCar;

public class CarDAO extends AbstractDAO 
{	String table;
	ShopCar scar;
	@Override public void save(EntityDomain ed) 
	{	this.scar = (ShopCar)ed;
		this.table = this.scar.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.connection.setAutoCommit(false);
			
			this.ps = this.connection.prepareStatement("INSERT INTO " + this.table +
				" (car_cli_id, car_cur_id) VALUES(?, ?)", this.ps.RETURN_GENERATED_KEYS);
			
			this.ps.setInt(1, this.scar.getClient().getId());
			this.ps.setInt(2, this.scar.getCourses().get(0).getId());
			
			this.ps.executeUpdate();
			
			this.rs = this.ps.getGeneratedKeys();
			
			if(this.rs.next())	this.scar.setId(this.rs.getInt(1));
			
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

	@Override public void update(EntityDomain ed) {}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	Client client = (Client)ed;
		List<EntityDomain> entities = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.ps = this.connection.prepareStatement("SELECT * FROM shopcar " +
				"WHERE car_cli_id = ?");
			
			this.ps.setInt(1, client.getId());
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	this.scar = new ShopCar();
				this.scar.setCourses(new ArrayList<Course>());
				Course course = new Course();
				course.setId(this.rs.getInt(3));
				this.scar.getCourses().add(course);
				entities.add(this.scar);
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
		return entities;
	}

	@Override public List<EntityDomain> search() 
	{return null;}
	
	public List<Course> searchCourses(Client client)
	{	List<Course> courses = new ArrayList<>();
		Course course = null;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.ps = this.connection.prepareStatement("SELECT cur.id, cur.titulo, cur.valor, cur.gr_precos FROM course " + 
				"AS cur JOIN shopcar as sca WHERE sca.car_cli_id = ? AND sca.car_cur_id = cur.id");
			
			this.ps.setInt(1, client.getId());
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	course = new Course();
				course.setId(this.rs.getInt(1));
				course.setName(this.rs.getString(2));
				course.setPrice(this.rs.getDouble(3));
				course.setGrupoP(this.rs.getString(4));
				courses.add(course);
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
		return courses;
	}
	
	public void deleteCourses(Client client)
	{	try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
		
			this.ps = this.connection.prepareStatement(
				"DELETE FROM shopcar WHERE car_cli_id = ?");
			
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
	
	public boolean deleteClientCourse(Client client, Course course)
	{	boolean deletou = false;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
		
			this.ps = this.connection.prepareStatement(
				"DELETE FROM shopcar WHERE car_cli_id = ? AND car_cur_id = ?");
			
			this.ps.setInt(1, client.getId());
			this.ps.setInt(2, course.getId());
			
			this.ps.executeUpdate();
			
			this.connection.commit();
			
			deletou = true;
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
		return deletou;
	}

	@Override
	public void updateKey(EntityDomain ed) {
		// TODO Auto-generated method stub
		
	}
}