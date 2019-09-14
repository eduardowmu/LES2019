package br.edu.les2019.view;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;

public class ShopCarView implements IViewHelper 
{	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	return null;
	}

	@Override public void setView(Result result, HttpServletRequest request, 
		HttpServletResponse response)	throws IOException, ServletException 
	{	
	}
}