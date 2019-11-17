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

import br.edu.les2019.dao.CarDAO;
import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.dao.CupomDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.dao.ItemDAO;
import br.edu.les2019.dao.SaleDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.Motivo;
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
	IDAO dao;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet2() 
    {	RequestDispatcher rd = null;
		this.result = new Result();
		this.client = new Client();
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
				this.client.setId(Integer.parseInt(request.getParameter("clientID")));
				this.client.setName("");
				this.client.setSurname("");
				for(EntityDomain ed:new ClientDAO().search(client))
				{	if(this.client.getId() == ed.getId())
					{this.client = (Client)ed;}
				}
				
				scar.setClient(client);
				
				course.setId(Integer.parseInt(request.getParameter("courseID")));
				course.setName("");
				course.setInstructor("");
				course.setCategoria("");
				List<EntityDomain> entities = new CourseDAO().search(course);
				for(EntityDomain e2:entities)
				{	if(course.getId() == e2.getId())
					{	course = (Course)e2;
						break;
					}
				}
				
				scar.setCourses(new ArrayList<Course>());
				scar.getCourses().add(course);
				
				this.result.setEntities(new ArrayList<EntityDomain>());
				
				this.result.getEntities().add(client);
				this.result.getEntities().add(scar);
				
				//inclui cliente da sessão
				this.result.getEntities().addAll(new CourseDAO().search());
				rd = request.getRequestDispatcher("curso_informacao.jsp");
				
				break;
				
			case "viewSale":
				List<Item> itens = new ArrayList<>();
				scar = new ShopCar();
				scar.setCourses(new ArrayList<Course>());
				for(int i = 0; i < Integer.parseInt(request.getParameter("qtd_itens")); i++)
				{	course = new Course();
					course.setId(Integer.parseInt(request.getParameter("courseID"+i)));
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
				
				this.client.setId(Integer.parseInt(request.getParameter("clientID")));
				this.client.setName("");
				this.client.setSurname("");
				List<EntityDomain> clients = new ClientDAO().search(client);
				for(EntityDomain ed:clients)
				{	if(ed.getId() == client.getId())
					{client = (Client)ed;}
				}
				
				Sale sale = new Sale(itens, Double.parseDouble(request.getParameter("total")), 
					"", "pendente", client, null);
				
				this.result.setEntities(new ArrayList<EntityDomain>());
				
				this.result.getEntities().add(sale);
				this.result.getEntities().add(client);
				this.result.getEntities().addAll(new CourseDAO().search());
				
				rd = request.getRequestDispatcher("pagamento2.jsp");
				
				break;
				
			case "deleteItem":
				this.result = (Result)request.getSession().getAttribute("result");
				this.client.setId(Integer.parseInt(request.getParameter("clientID")));
				course.setId(Integer.parseInt(request.getParameter("courseID")));
				CarDAO sdao = new CarDAO();
				if(sdao.deleteClientCourse(this.client, course))
				{	for(EntityDomain ed:this.result.getEntities())
					{	if(ed instanceof ShopCar)
						{	ShopCar sc = new ShopCar();
							for(Course c:sc.getCourses())
							{	if(c.getId() == course.getId())
								{sc.getCourses().remove(c);}
							}
						}
					}
				}
				rd = request.getRequestDispatcher("meuCarrinho.jsp");
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
	{	Cupom cupom = null;
		switch(request.getParameter("action"))
		{	case "gerarCupom":
				this.result = (Result)request.getSession().getAttribute("result");
				
				if(this.result != null)
				{	for(EntityDomain ed:result.getEntities())
					{	if(ed instanceof Client)	
						{	this.client = (Client)ed;
							break;
						}
					}
				}
				
				Item item = new Item();
				item.setId(Integer.parseInt(request.getParameter("item_id")));
				
				Motivo motivo = new Motivo(request.getParameter("motivo"));
				
				cupom = new Cupom(Double.parseDouble(request.getParameter("valor")), 
					"troca", request.getParameter("item_code"), "pendente", this.client, item, motivo);
				
				CupomDAO cupdao = new CupomDAO();
				cupdao.save(cupom);
				if(cupdao.isSalvou())
				{	this.result.getEntities().remove(this.client);
					this.client.setName("");
					this.client.setSurname("");
					this.result.getEntities().addAll(new ClientDAO().search(this.client));
					this.result.setMsg("Cupom " + cupom.getCodigo() + " gerado com sucesso");
					rd = request.getRequestDispatcher("meusCupons.jsp");
				}
				
				else
				{	this.result.setMsg("Não foi possível gerar o cupom");
					rd = request.getRequestDispatcher("meusCupons.jsp");
				}
				
				break;
				
			case "aprovarCupom":
				cupom = new Cupom();
				cupom.setCodigo(request.getParameter("cupom_id"));
				this.client.setId(Integer.parseInt(request.getParameter("cli_id")));
				cupom.setClient(client);
				cupom.setStatus("aprovado");
				
				dao = new CupomDAO();
				dao.update(cupom);
				
				this.result.setEntities(new ArrayList<EntityDomain>());
				this.result.getEntities().addAll(new ClientDAO().search());
				this.result.getEntities().addAll(new CourseDAO().search());
				
				rd = request.getRequestDispatcher("gerenciarCupons.jsp");
				
				break;
				
			case "aprovarPagto":
				Sale sale = new Sale();
				sale.setId(Integer.parseInt(request.getParameter("saleID")));
				sale.setClient(new Client());
				sale.getClient().setId(Integer.parseInt(request.getParameter("clientID")));
				
				if(request.getParameter("status").equalsIgnoreCase("pendente"))
				{	sale.setSaleStatus("aprovada");
					dao = new SaleDAO();
					dao.update(sale);
				}
					
				this.result.setEntities(new ArrayList<EntityDomain>());
				this.result.getEntities().addAll(new ClientDAO().search());
				this.result.getEntities().addAll(new CourseDAO().search());
				
				rd = request.getRequestDispatcher("gerenciarVendas.jsp");
				
				break;
		}
		request.getSession().setAttribute("result", this.result);
		rd.forward(request, response);
	}
}
