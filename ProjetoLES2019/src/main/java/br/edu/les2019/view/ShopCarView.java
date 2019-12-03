package br.edu.les2019.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.dao.CarDAO;
import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.ShopCar;
import br.edu.les2019.result.Result;

public class ShopCarView implements IViewHelper 
{	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	ShopCar scar = new ShopCar();
		Client client = new Client();
		Course course = new Course();
		switch(request.getParameter("action"))
		{	case "save":
				client.setId(Integer.parseInt(request.getParameter("clientID")));
				client.setName("");
				client.setSurname("");
				for(EntityDomain ed:new ClientDAO().search(client))
				{	if(client.getId() == ed.getId())
					{client = (Client)ed;}
				}
				
				course.setId(Integer.parseInt(request.getParameter("courseID")));
				course.setName("");
				course.setInstructor("");
				course.setCategoria("");
				for(EntityDomain e2:new CourseDAO().search(course))
				{	if(course.getId() == e2.getId())
					{course = (Course)e2;}
				}
				
				scar.setClient(client);
				scar.setCourses(new ArrayList<Course>());
				scar.getCourses().add(course);
				
				CarDAO cadao = new CarDAO();
				
				List<Course> courses = cadao.searchCourses(client);
 				
				if(courses != null && !courses.isEmpty())
				{scar.getCourses().addAll(courses);}
				
				break;
				
			case "delete":
				
				break;
		}
		return scar;
	}

	@Override public void setView(Result result, HttpServletRequest request, 
		HttpServletResponse response) throws IOException, ServletException 
	{	RequestDispatcher rd = null;
		switch(request.getParameter("action"))
		{	case "save":
				if(result.getMsg() == null)
				{	result.setMsg("Minhas Compras");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("meuCarrinho.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("cursos_compra.jsp");
				}
				break;
		}
		rd.forward(request, response);
	}
}