package br.edu.les2019.view;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.ParseException;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.ReportCoursesSold;
import br.edu.les2019.result.Result;

public class ReportVH implements IViewHelper 
{	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date inicio = new Date();
	Date fim = new Date();
	ReportCoursesSold rcs = null;
	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	switch(request.getParameter("action"))
		{	case "search":
				try	
				{	rcs = new ReportCoursesSold(df.parse(request.getParameter("txtDataInicio")), 
						df.parse(request.getParameter("txtDataFim")));
				} 
				catch (java.text.ParseException e) 
				{	System.out.println(e.getMessage());
					e.printStackTrace();
				}
				
				if(request.getParameter("clientID") != null && request.getParameter("clientID").equals(""))
				{	rcs.setClient(new Client());
					rcs.getClient().setId(1);
					rcs.getClient().setName("");
					rcs.getClient().setSurname("");
					ClientDAO cdao = new ClientDAO();
					List<EntityDomain> clients = new ArrayList<>();
					clients = cdao.search(rcs.getClient());
					if(clients != null && !clients.isEmpty())
					{	for(EntityDomain ed:clients)
						{	if(rcs.getClient().getId() == ed.getId())
							{rcs.setClient((Client)ed);}
							break;
						}
					}
				}
			
				break;
		}
		return rcs;
	}

	@Override public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException 
	{	RequestDispatcher rd = null;	//direciona os resultados para a página de gerenciamento de relatorio
		switch(request.getParameter("action"))
		{	case "search":
				if(result.getMsg() == null)	{result.setMsg("Resultados");}
				
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("gerarRelatorios.jsp");
				
				break;
		}
		
		rd.forward(request, response);
	}
}