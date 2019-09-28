package br.edu.les2019.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.Payment;
import br.edu.les2019.domain.Sale;
import br.edu.les2019.result.Result;

public class SaleView implements IViewHelper 
{	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	Sale sale = null;
		Course course = null;
		Item item = null;
		Payment payment = null;
		List<Item> itens = new ArrayList<>();
		Client client = new Client();
		
		switch(request.getParameter("action"))
		{	case "save":
				for(int i = 0; i < Integer.parseInt(request.getParameter("qtd_itens")); i++)
				{	course = new Course(Integer.parseInt(request.getParameter("courseID"+(i+1))));
					course.setName("");
					course.setInstructor("");
					course.setCategoria("");
					List<EntityDomain> eds = new CourseDAO().search(course);
					for(EntityDomain ed:eds)
					{course = (Course)ed;}
					item = new Item(course, request.getParameter("itemCode"+(i+1)));
					item.setId(Integer.parseInt(request.getParameter("itemID"+(i+1))));
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
				
				List<Payment> pays = new ArrayList<>();
				payment = new Payment();
				
				payment.setQtdParcelas(Integer.parseInt("id_qtde"));
				payment.setStatus("pendente");
				payment.setCard(client.getCards().get(0));
				pays.add(payment);
				
				if(Integer.parseInt(request.getParameter("qtd_card")) > 0)
				{	int k = 1;
					for(int i = 1; i <= Integer.parseInt(request.getParameter("qtd_card")); i++)
					{	if(request.getParameter("selCARD"+i) != null && 
							!request.getParameter("selCARD"+i).equals(""))
						{	pays.add(new Payment());
							pays.get(k).setCard(client.getCards().get(Integer.parseInt(request.getParameter("selCARD"+i))));
							k++;
						}
					}
				}
				
				if(pays.size() == 1)
				{	sale = new Sale(itens, Double.parseDouble(request.getParameter("total")), 
						request.getParameter("pedido"), "pendente", client, pays);
				}
				
				else
				{	sale = new Sale(itens, Double.parseDouble(request.getParameter("total")), 
						request.getParameter("pedido"), "pendente", client, pays);
				}
				
				break;
		}
		return sale;
	}

	@Override public void setView(Result result, HttpServletRequest request, 
		HttpServletResponse response) throws IOException, ServletException 
	{	RequestDispatcher rd = null;
		
		switch(request.getParameter("action"))
		{	case "save":
				request.getSession().setAttribute("result", result);
				if(result.getMsg() == null)
				{rd = request.getRequestDispatcher("inicialAluno.jsp");}
				
				else
				{rd = request.getRequestDispatcher("pagamento2.jsp");}
				
				break;
		}
	}
}