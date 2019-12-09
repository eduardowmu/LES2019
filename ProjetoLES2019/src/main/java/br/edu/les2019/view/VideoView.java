package br.edu.les2019.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Video;
import br.edu.les2019.result.Result;

public class VideoView implements IViewHelper 
{	Video video = new Video();
	Result res = null;
	Course c = null;
	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	switch(request.getParameter("action"))
		{	case "save":
				res = (Result)request.getSession().getAttribute("result");
				
				if(res != null)
				{	if(res.getEntities() != null && !res.getEntities().isEmpty())
					{	for(EntityDomain e:res.getEntities())
						{	if(e instanceof Course)
							{	c = (Course)e;
								break;
							}
						}
					}
				}
				video.setCourse(c);
				video.setTitle(request.getParameter("titulo").trim());
				video.setTime(Double.parseDouble(request.getParameter("tempo").trim()));
				if(request.getParameter("descricao") != null)
				{video.setDescription(request.getParameter("descricao").trim());}
				video.setLink(request.getParameter("frame"));
				break;
				
			case "show":
				res = (Result)request.getSession().getAttribute("result");
				if(res != null)
				{	if(res.getEntities() != null && !res.getEntities().isEmpty())
					{	for(EntityDomain e:res.getEntities())
						{	if(e instanceof Course)
							{	c = (Course)e;
								break;
							}
						}
					}
				}
				video.setCourse(c);
				video.setId(Integer.parseInt(request.getParameter("video_id")));
				video.setTitle(request.getParameter("titulo"));
				video.setTime(Double.parseDouble(request.getParameter("tempo")));
				video.setDescription(request.getParameter("descricao"));
				break;
			
			case "update":
				res = (Result)request.getSession().getAttribute("result");
				for(EntityDomain e:res.getEntities())
				{	if(e instanceof Video)
					{	Video v = (Video)e;
						c = v.getCourse();
					}
				}
				video.setCourse(c);
				video.setId(Integer.parseInt(request.getParameter("video_id")));
				video.setTitle(request.getParameter("titulo").trim());
				video.setTime(Double.parseDouble(request.getParameter("tempo").trim()));
				if(request.getParameter("descricao") != null)
				{video.setDescription(request.getParameter("descricao").trim());}
				video.setLink(request.getParameter("frame"));
				
				break;
				
			case "delete":
				video.setId(Integer.parseInt(request.getParameter("video_id")));
				c = new Course();
				c.setId(Integer.parseInt(request.getParameter("codigo")));
				c.setDescricao("");
				c.setCategoria("");
				c.setInstructor("");
				c.setName("");
				
				break;
		}
		return video;
	}

	@Override public void setView(Result result, HttpServletRequest request, 
		HttpServletResponse response)	throws IOException, ServletException 
	{	RequestDispatcher rd = null;
		switch(request.getParameter("action"))
		{	case "save":
				if(result.getMsg() == null)	
				{	result.setMsg("Salvo com sucesso");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("gerenciarVideos.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("cadastroVideos.jsp");
				}
				
				break;
				
			case "show":
				if(result.getMsg() == null)	
				{result.setMsg("Altere os dados");}
				
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("alterarVideos.jsp");
				
				break;
				
			case "update":
				result.getEntities().add(c);
				if(result.getMsg() == null)	
				{	result.setMsg("Alterado com sucesso");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("gerenciarVideos.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("alterarVideos.jsp");
				}
				
				break;
				
			case "delete":
				result.getEntities().addAll(new CourseDAO().search(c));
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("gerenciarVideos.jsp");
				break;
		}
		rd.forward(request, response);
	}
}