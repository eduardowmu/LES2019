package br.edu.les2019.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;

public class CupomView implements IViewHelper 
{	Cupom cupom = new Cupom();
	Client client = new Client();
	Result res = null;
	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	switch(request.getParameter("action"))
		{	case "update":
				client.setId(Integer.parseInt(request.getParameter("cli_id")));
				
				cupom.setCodigo(request.getParameter("cupom_id"));
				cupom.setClient(client);
				cupom.setStatus(request.getParameter("cupom_status"));
				
				break;
		}
		return cupom;
	}

	@Override public void setView(Result result, HttpServletRequest request, 
			HttpServletResponse response) throws IOException, ServletException 
	{	RequestDispatcher rd = null;
		switch("action")
		{	case "update":
				
				break;
		}
	}
}