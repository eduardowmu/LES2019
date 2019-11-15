package br.edu.les2019.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Video;
import br.edu.les2019.result.Result;

public class VideoView implements IViewHelper 
{	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	Video video = new Video();
		switch(request.getParameter("action"))
		{	case "save":
				video.setCourse(new Course());
				video.getCourse().setId(Integer.parseInt(request.getParameter("course_id")));
				video.setTitle(request.getParameter("titulo"));
				video.setTime(Double.parseDouble(request.getParameter("tempo")));
				if(request.getParameter("descricao") != null && !request.getParameter("descricao").equals(""))
				{video.setDescription(request.getParameter("descricao"));}
				video.setLink(request.getParameter("frame"));
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
				{result.setMsg("Curso Salvo com sucesso");}
				
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("ListaCursos.jsp");
				break;
		}
	}
}