package br.edu.les2019.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		Map<CreditCard, Double> paymap = null;
		List<Item> itens = new ArrayList<>();
		Client client = new Client();
		
		switch(request.getParameter("action"))
		{	case "save":
				for(int i = 0; i < Integer.parseInt(request.getParameter("qtd_itens")); i++)
				{	course = new Course(Integer.parseInt(request.getParameter("courseID"+i)));
					course.setName("");
					course.setInstructor("");
					course.setCategoria("");
					List<EntityDomain> eds = new CourseDAO().search(course);
					for(EntityDomain ed:eds)
					{course = (Course)ed;}
					item = new Item(course, request.getParameter("itemCode"+i));
					item.setStatus("pendente");
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
				
				if(request.getParameter("email") != null && 
					!request.getParameter("email").equals(""))
				{client.getEmails().add(request.getParameter("email"));}
				
				payment = new Payment();
				payment.setClient(client);
				payment.setQtdParcelas(Integer.parseInt(request.getParameter("id_qtde")));
				payment.setStatus("pendente");
				paymap = new HashMap<>();
				
				if(request.getParameter("cardValor") == null || request.getParameter("cardValor").equals("0.00"))
				{paymap.put(client.getCards().get(0), Double.parseDouble(request.getParameter("total")));}
				
				else	
				{	paymap.put(client.getCards().get(0), Double.parseDouble(request.getParameter("id_valor_parcela")));
					paymap.put(client.getCards().get(1), Double.parseDouble(request.getParameter("cardValor")));
				}
				/*if(Integer.parseInt(request.getParameter("qtd_card")) > 0)
				{	int k = 1;
					for(int i = 1; i <= Integer.parseInt(request.getParameter("qtd_card")); i++)
					{	if(request.getParameter("selCARD"+i) != null && 
							!request.getParameter("selCARD"+i).equals(""))
						{	CreditCard card = new CreditCard();
							card.setId(Integer.parseInt(request.getParameter("cardID"+k)));
							client.getCards().add(card);
							paymap.put(client.getCards().get(k), Double.parseDouble("parcela"));
							k++;
						}
					}
				}*/
				
				payment.setPaymap(paymap);
				
				sale = new Sale(itens, Double.parseDouble(request.getParameter("total")), 
					request.getParameter("pedido"), "pendente", client, payment);
				
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
				{rd = request.getRequestDispatcher("meusCursos2.jsp");}
				
				else
				{rd = request.getRequestDispatcher("pagamento2.jsp");}
				
				break;
		}
		//faz o redirecionamento com resposta da requisição
		rd.forward(request, response);
	}
}