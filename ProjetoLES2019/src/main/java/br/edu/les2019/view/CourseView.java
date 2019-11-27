package br.edu.les2019.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;

public class CourseView implements IViewHelper 
{	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	Course course = new Course();
		switch(request.getParameter("action"))
		{	case "save":
				course.setName(request.getParameter("titulo"));
				
				course.setInstructor(request.getParameter("instrutor"));
				
				if(!request.getParameter("cat").equals("") && request.getParameter("cat") != null)
				{course.setCategoria(request.getParameter("cat"));}
				
				else course.setCategoria("");
				
				course.setDescricao(request.getParameter("descricao"));
				
				course.setPrice(Double.parseDouble(request.getParameter("valor")));
				
				course.setGrupoP(request.getParameter("grupo"));
				
				course.setStatus("inativado");
				break;
				
			case "update":
				course.setId(Integer.parseInt(request.getParameter("id")));
				course.setName(request.getParameter("titulo"));
				course.setInstructor(request.getParameter("instrutor"));
				
				if(request.getParameter("cat").equals("") || request.getParameter("cat") != null)
				{course.setCategoria(request.getParameter("cat"));}
				
				else course.setCategoria(request.getParameter("cat"));
				
				course.setDescricao(request.getParameter("descricao"));
				course.setPrice(Double.parseDouble(request.getParameter("valor")));
				course.setGrupoP(request.getParameter("grupo"));
				break;
				
			case "search":
				if(!request.getParameter("id").equals("") && request.getParameter("id") != null)
				{course.setId(Integer.parseInt(request.getParameter("id")));}
				
				else course.setId(0);
				
				if(!request.getParameter("nome").equals("") && request.getParameter("nome") != null)
				{course.setName(request.getParameter("nome"));}
				
				else course.setName("");
				
				if(!request.getParameter("instrutor").equals("") && request.getParameter("instrutor") != null)
				{course.setInstructor(request.getParameter("instrutor"));}
				
				else course.setInstructor("");
				
				if(!request.getParameter("categoria").equals("") && request.getParameter("categoria") != null)
				{course.setCategoria(request.getParameter("instrutor"));}
				
				else course.setCategoria("");
				
				break;
				
			case "show":
				course.setId(Integer.parseInt(request.getParameter("codigo")));
				course.setName("");
				course.setInstructor("");
				course.setCategoria("");
				break;
			
			case "delete":
				course.setId(Integer.parseInt(request.getParameter("codigo")));
				break;
				
			case "add":
				course.setId(Integer.parseInt(request.getParameter("codigo")));
				break;
		}
		return course;
	}

	@Override public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException 
	{	RequestDispatcher rd = null;	//direciona os resultados para a página 
										//de gerenciamento de cursos
	
		switch(request.getParameter("action"))
		{	case "save":
				if(result.getMsg() == null)
				{	result.setMsg("Curso cadastrado!");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("ListaCursos.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("cadastroCursos.jsp");
				}
				break;
				
			case "update":
				if(result.getMsg() == null)
				{	result.setMsg("Curso alterado!");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("ListaCursos.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("alteraCursos.jsp");
				}
				break;
				
			case "search":
				if(result.getMsg() == null)
				{result.setMsg("Resultado da busca");}
				
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("ListaCursos.jsp");
				break;
			
			case "show":
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("alteraCursos.jsp");
				break;
			
			case "view":
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("curso_informacao.jsp");
				break;
				
			case "delete":
				result.setMsg("Curso deletado com sucesso");
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("ListaCursos.jsp");
				break;
				
			case "add":
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("videos.jsp");
				break;
		}
		rd.forward(request, response);
	}
}