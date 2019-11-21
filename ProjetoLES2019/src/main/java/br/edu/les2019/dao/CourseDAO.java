package br.edu.les2019.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.CursoCupom;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.ReportCoursesSold;
import br.edu.les2019.domain.Video;

public class CourseDAO extends AbstractDAO 
{	Course course = null;
	//define o nome da tabela
	String table;
	public CourseDAO() {super();}
	@Override public void save(EntityDomain ed) 
	{	this.course = (Course)ed;
		this.table = this.course.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
				this.connection = this.getConnection();
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("INSERT INTO " + this.table + 
				"(instrutor, categoria, titulo, descricao, valor, gr_precos) VALUES"+
				"(?, ?, ?, ?, ?, ?)", this.ps.RETURN_GENERATED_KEYS);
			
			this.ps.setString(1, this.course.getInstructor());
			this.ps.setString(2, this.course.getCategoria());
			this.ps.setString(3, this.course.getName());
			this.ps.setString(4, this.course.getDescricao());
			this.ps.setDouble(5, this.course.getPrice());
			this.ps.setString(6, this.course.getGrupoP());
			
			this.ps.executeUpdate();
			this.rs = this.ps.getGeneratedKeys();
			if(this.rs.next())	this.course.setId(this.rs.getInt(1));
			
			this.connection.commit();
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {System.out.println(e1.getMessage());}
			e.printStackTrace();
		}
		finally
		{	try
			{	this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2){System.out.println(e2.getMessage());}
		}
	}

	@Override public void update(EntityDomain ed) 
	{	this.course = (Course)ed;
		this.table = this.course.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
				this.connection = this.getConnection();
			this.connection.setAutoCommit(false);
			this.ps = this.connection.prepareStatement("UPDATE " + this.table + 
				" SET instrutor = ?, categoria = ?, titulo = ?, descricao = ?, "
				+ "valor = ?, gr_precos = ? WHERE id = ?");
			
			this.ps.setString(1, this.course.getInstructor());
			this.ps.setString(2, this.course.getCategoria());
			this.ps.setString(3, this.course.getName());
			this.ps.setString(4, this.course.getDescricao());
			this.ps.setDouble(5, this.course.getPrice());
			this.ps.setString(6, this.course.getGrupoP());
			this.ps.setInt(7, this.course.getId());
			
			this.ps.executeUpdate();
			
			this.connection.commit();
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {System.out.println(e1.getMessage());}
			e.printStackTrace();
		}
		finally
		{	try
			{	this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2)	{System.out.println(e2.getMessage());}
		}
	}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	List<EntityDomain> eds = new ArrayList<>();
		this.course = (Course)ed;
		this.table = this.course.getClass().getSimpleName().toLowerCase();
		
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.ps = this.connection.prepareStatement("SELECT * FROM " + this.table +
				" WHERE id = ? OR titulo LIKE ? OR instrutor LIKE ? OR categoria = ?");
		
			if(this.course.getId() > 0)	this.ps.setInt(1, this.course.getId());
			
			else this.ps.setInt(1, 0);
			
			if(this.course.getName() != null && !this.course.getName().equals(""))
			{this.ps.setString(2, this.course.getName() + "%");}
			
			else this.ps.setString(2, "");
			
			if(this.course.getInstructor() != null && !this.course.getInstructor().equals(""))
			{this.ps.setString(3, this.course.getInstructor() + "%");}
			
			else this.ps.setString(3, "");
			
			if(this.course.getCategoria() != null && !this.course.getCategoria().equals(""))
			{this.ps.setString(4, this.course.getCategoria());}
			
			else this.ps.setString(4, "");
			
			this.rs = this.ps.executeQuery();
			while(this.rs.next())
			{	this.course = new Course();
				this.course.setId(this.rs.getInt(1));
				this.course.setInstructor(this.rs.getString(2));
				this.course.setCategoria(this.rs.getString(3));
				this.course.setName(this.rs.getString(4));
				this.course.setDescricao(this.rs.getString(5));
				this.course.setPrice(this.rs.getDouble(6));
				this.course.setGrupoP(this.rs.getString(7));
				this.course.setRegistry(new java.sql.Date(this.rs.getDate(8).getTime()));
				this.course.setPhoto(this.rs.getString(9));
				VideoDAO dao = new VideoDAO();
				dao.connection = this.connection;
				dao.ctrlTransaction = false;
				List<EntityDomain> videos = dao.search(course);
				if(videos != null)
				{	course.setVideos(new ArrayList<>());
					for(EntityDomain e:videos)
					{	Video video = (Video)e;
						if(course.getId() == video.getCourse().getId())
						{course.getVideos().add(video);}
					}
				}
				eds.add(this.course);
			}
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {System.out.println(e1.getMessage());}
			e.printStackTrace();
		}
		finally
		{	try
			{	this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2)	{System.out.println(e2.getMessage());}
		}
		return eds;
	}

	@Override public List<EntityDomain> search() 
	{	List<EntityDomain> eds = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
				this.connection = this.getConnection();
			this.ps = this.connection.prepareStatement("SELECT * FROM course");
			this.rs = this.ps.executeQuery();
			while(this.rs.next())
			{	this.course = new Course();
				this.course.setId(this.rs.getInt(1));
				this.course.setInstructor(this.rs.getString(2));
				this.course.setCategoria(this.rs.getString(3));
				this.course.setName(this.rs.getString(4));
				this.course.setDescricao(this.rs.getString(5));
				this.course.setPrice(this.rs.getDouble(6));
				this.course.setGrupoP(this.rs.getString(7));
				this.course.setRegistry(new java.sql.Date(this.rs.getDate(8).getTime()));
				this.course.setPhoto(this.rs.getString(9));
				eds.add(this.course);
			}
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {System.out.println(e1.getMessage());}
			e.printStackTrace();
		}
		finally
		{	try
			{	this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2)	{System.out.println(e2.getMessage());}
		}
		return eds;
	}
	
	public void searchCursoCupom(ReportCoursesSold rcs)
	{	CursoCupom cc = null;
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.connection.setAutoCommit(false);
			
			this.ps = this.connection.prepareStatement(
					"SELECT c.titulo, COUNT(cup.id) AS quantidade " + 
					"FROM course AS c " + 
					"INNER JOIN cupom AS cup " + 
					"INNER JOIN item AS i " + 
					"WHERE i.id = cup.cup_ite_id " + 
					"AND c.id = i.ite_cur_id " + 
					"AND cup.registry BETWEEN ? AND ? " + 
					"GROUP BY c.titulo " + 
					"ORDER BY COUNT(cup.id) DESC");
			
			this.ps.setDate(1, new java.sql.Date(rcs.getStartDate().getTime()));
			this.ps.setDate(2, new java.sql.Date(rcs.getEndDate().getTime()));
			
			this.rs = this.ps.executeQuery();
			
			rcs.setCursosCupom(new ArrayList<>());
			
			while(this.rs.next())
			{	cc = new CursoCupom();
				cc.setCurso(this.rs.getString(1));
				cc.setQtd(this.rs.getInt(2));
				rcs.getCursosCupom().add(cc);
			}
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {System.out.println(e1.getMessage());}
			e.printStackTrace();
		}
		finally
		{	try
			{	this.ps.close();
				if(this.ctrlTransaction)	this.connection.close();
			}
			catch(SQLException e2)	{System.out.println(e2.getMessage());}
		}
	}
	
	@Override
	public void updateKey(EntityDomain ed) {
		// TODO Auto-generated method stub
		
	}
}