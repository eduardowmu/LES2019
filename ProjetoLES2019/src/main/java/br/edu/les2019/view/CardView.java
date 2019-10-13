package br.edu.les2019.view;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;

public class CardView implements IViewHelper 
{	Result res = null;
	Client client = null;
	CreditCard card = new CreditCard();
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	switch(request.getParameter("action"))
		{	case "save":
				res = (Result)request.getSession().getAttribute("result");
				for(EntityDomain ed:res.getEntities())
				{	if(ed instanceof Client)
					{	client = (Client)ed;
						break;
					}
				}
				
				card.setBanner(request.getParameter("bandeira"));
				card.setNumber(request.getParameter("numero"));
				card.setClient(client);
				card.setCode(request.getParameter("code"));
				try {card.setDeadline(df.parse(request.getParameter("vencimento")));}
				catch(ParseException e) {System.out.println(e.getMessage());}
				card.setName(request.getParameter("titular"));
				client.getCards().add(card);
				
				break;
		}
	
		return card;
	}

	@Override public void setView(Result result, HttpServletRequest request, 
		HttpServletResponse response)	throws IOException, ServletException 
	{	RequestDispatcher rd = null;
		switch(request.getParameter("action"))
		{	case "save":
				if(result.getMsg() == null)	
				{	result.setMsg("Cartão Salvo com sucesso");
					this.addEntities(result, res, request);
					rd = request.getRequestDispatcher("pagamento2.jsp");
				}
				
				else
				{	this.addEntities(result, res, request);
					rd = request.getRequestDispatcher("addCartoes.jsp");
				}
				
				break;
		}
		rd.forward(request, response);
	}
	private void addEntities(Result result, Result res, HttpServletRequest request)
	{	res = (Result)request.getSession().getAttribute("result");
		for(EntityDomain edo:res.getEntities())
		{	if(edo instanceof Client)	continue;
			
			result.getEntities().add(edo);
		}
		request.getSession().setAttribute("result", result);
	}
}