package br.edu.les2019.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.dao.CupomDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.dao.ItemDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.Sale;
import br.edu.les2019.domain.ShopCar;
import br.edu.les2019.result.Result;

/**
 * Servlet implementation class MyServlet2
 */
@WebServlet("/MyServlet2")
public class MyServlet2 extends HttpServlet 
{	private static final long serialVersionUID = 1L;
	Result result;
	RequestDispatcher rd;
	Client client;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet2() 
    {	RequestDispatcher rd = null;
		result = new Result();
		client = new Client();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{	ShopCar scar = null;
		Course course = new Course();
		switch(request.getParameter("action"))
		{	case "viewItem":
				scar = new ShopCar();
				client.setId(Integer.parseInt(request.getParameter("clientID")));
				client.setName("");
				client.setSurname("");
				for(EntityDomain ed:new ClientDAO().search(client))
				{	if(client.getId() == ed.getId())
					{client = (Client)ed;}
				}
				
				scar.setClient(client);
				
				course.setId(Integer.parseInt(request.getParameter("courseID")));
				course.setName("");
				course.setInstructor("");
				course.setCategoria("");
				for(EntityDomain e2:new CourseDAO().search(course))
				{	if(course.getId() == e2.getId())
					{course = (Course)e2;}
				}
				
				scar.setCourses(new ArrayList<Course>());
				scar.getCourses().add(course);
				
				result.setEntities(new ArrayList<EntityDomain>());
				
				result.getEntities().add(client);
				result.getEntities().add(scar);
				
				//inclui cliente da sessão
				result.getEntities().addAll(new CourseDAO().search());
				rd = request.getRequestDispatcher("curso_informacao.jsp");
				
				break;
				
			case "viewSale":
				List<Item> itens = new ArrayList<>();
				scar = new ShopCar();
				scar.setCourses(new ArrayList<Course>());
				for(int i = 0; i < Integer.parseInt(request.getParameter("qtd_itens")); i++)
				{	course = new Course(Integer.parseInt(request.getParameter("courseID"+(i))));
					course.setName("");
					course.setInstructor("");
					course.setCategoria("");
					List<EntityDomain> eds = new CourseDAO().search(course);
					for(EntityDomain ed:eds)
					{course = (Course)ed;}
					scar.getCourses().add(course);
					Item item = new Item(course, request.getParameter("code"+i));
					itens.add(item);
				}
				
				client.setId(Integer.parseInt(request.getParameter("clientID")));
				client.setName("");
				client.setSurname("");
				List<EntityDomain> clients = new ClientDAO().search(client);
				for(EntityDomain ed:clients)
				{	if(ed.getId() == client.getId())
					{client = (Client)ed;}
				}
				
				Sale sale = new Sale(itens, Double.parseDouble(request.getParameter("total")), 
					"", "pendente", client, null);
				
				result.setEntities(new ArrayList<EntityDomain>());
				
				result.getEntities().add(sale);
				result.getEntities().add(client);
				result.getEntities().addAll(new CourseDAO().search());
				
				rd = request.getRequestDispatcher("pagamento2.jsp");
				
				break;
		}
		request.getSession().setAttribute("result", result);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{	switch(request.getParameter("action"))
		{	case "gerarCupom":
				result = (Result)request.getSession().getAttribute("result");
				
				if(result != null)
				{	for(EntityDomain ed:result.getEntities())
					{	if(ed instanceof Client)	
						{	this.client = (Client)ed;
							break;
						}
					}
				}
				
				Item item = new Item();
				item.setId(Integer.parseInt(request.getParameter("item_id")));
				
				Cupom cupom = new Cupom(Double.parseDouble(request.getParameter("valor")), 
					"troca", request.getParameter("item_code"), "pendente", this.client, item);
				
				CupomDAO cupdao = new CupomDAO();
				cupdao.save(cupom);
				if(cupdao.isSalvou())
				{	result.getEntities().remove(this.client);
					this.client.setName("");
					this.client.setSurname("");
					result.getEntities().addAll(new ClientDAO().search(this.client));
					result.setMsg("Cupom " + cupom.getCodigo() + " gerado com sucesso");
					rd = request.getRequestDispatcher("meusCupons.jsp");
				}
				
				else
				{	result.setMsg("Não foi possível gerar o cupom");
					rd = request.getRequestDispatcher("meusCupons.jsp");
				}
			break;	
		}
		request.getSession().setAttribute("result", result);
		rd.forward(request, response);
	}
}
