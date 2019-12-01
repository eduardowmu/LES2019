package br.edu.les2019.view;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.dao.ItemDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.Motivo;
import br.edu.les2019.domain.Sale;
import br.edu.les2019.result.Result;

public class CupomView implements IViewHelper 
{	Cupom cupom = new Cupom();
	Client client = new Client();
	Result res = null;
	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	switch(request.getParameter("action"))
		{	case "save":
				Result result = (Result)request.getSession().getAttribute("result");
				for(EntityDomain ed:result.getEntities())
				{	if(ed instanceof Client)
					{	client = (Client)ed;
						break;
					}
				}
				
				cupom.setCodigo(request.getParameter("cliID")+"-"+request.getParameter("saleID"));
				if(request.getParameter("motivo") != null)
				{cupom.setMotivo(new Motivo(request.getParameter("motivo")));}
				else cupom.setMotivo(new Motivo(""));
				cupom.setClient(client);
				cupom.setSale(new Sale());
				cupom.getSale().setId(Integer.parseInt(request.getParameter("saleID")));
				List<EntityDomain> itens = new ItemDAO().search(cupom.getSale());
				if(itens != null && !itens.isEmpty())
				{	cupom.getSale().setListItem(new ArrayList<>());
					for(EntityDomain ed2:itens)
					{cupom.getSale().getListItem().add((Item)ed2);}
				}
				cupom.setStatus("pendente");
				cupom.setValue(Double.parseDouble(request.getParameter("total")));
				cupom.setTipo("troca");
				
				break;
		}
		return cupom;
	}

	@Override public void setView(Result result, HttpServletRequest request, 
			HttpServletResponse response) throws IOException, ServletException 
	{	RequestDispatcher rd = null;
		switch(request.getParameter("action"))
		{	case "save":
				if(result.getMsg() == null)
				{	result.setMsg("Cupom gerado com sucesso");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("meusCupons.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("minhasCompras.jsp");
				}
				break;
		}
		rd.forward(request, response);
	}
}