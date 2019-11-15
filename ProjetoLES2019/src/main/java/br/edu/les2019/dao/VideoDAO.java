package br.edu.les2019.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Video;

public class VideoDAO extends AbstractDAO 
{	public VideoDAO()	{super();}
	@Override public void save(EntityDomain ed) 
	{	Video video = (Video)ed;
		this.table = video.getClass().getSimpleName().toLowerCase();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
			
			this.ps = this.connection.prepareStatement("INSERT INTO " + this.table +
				"(vid_cur_id, titulo, descricao, duracao, frame) VALUES(?, ?, ?, ?, ?)", 
				this.ps.RETURN_GENERATED_KEYS);
			
			this.ps.setInt(1, video.getCourse().getId());
			this.ps.setString(2, video.getTitle());
			this.ps.setString(3, video.getDescription());
			this.ps.setDouble(4, video.getTime());
			this.ps.setString(5, video.getLink());
			
			this.ps.executeUpdate();
			
			this.rs = this.ps.getGeneratedKeys();
			
			if(this.rs.next())	video.setId(this.rs.getInt(1));
		}
		catch(SQLException e)
		{	System.err.println(e.getMessage());
			try {this.connection.rollback();}
			catch(SQLException e1) {e1.printStackTrace();}
			e.printStackTrace();
		}
		finally
		{	try
			{	if(this.ctrlTransaction)	
				{	this.ps.close();
					this.connection.close();
				}
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
	}

	@Override public void update(EntityDomain ed) 
	{}

	@Override public List<EntityDomain> search(EntityDomain ed) 
	{	Course course = (Course)ed;
		Video video = null;
		List<EntityDomain> entities = new ArrayList<>();
		try
		{	if(this.connection == null || this.connection.isClosed())
			{this.connection = this.getConnection();}
		
			this.ps = this.connection.prepareStatement(
				"SELECT * FROM video WHERE vid_cur_id = ?");
			
			this.ps.setInt(1, course.getId());
			
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next())
			{	video = new Video();
				video.setId(this.rs.getInt(1));
				video.setCourse(course);
				video.setTitle(this.rs.getString("titulo"));
				video.setDescription(this.rs.getString("descricao"));
				video.setTime(this.rs.getDouble("duracao"));
				video.setLink(this.rs.getString("frame"));
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
			{	if(this.ctrlTransaction)	
				{	this.ps.close();
					this.connection.close();
				}
			}
			catch(SQLException e2){e2.printStackTrace();}
		}
		return entities;
	}

	@Override public List<EntityDomain> search() {
		return null;
	}
}