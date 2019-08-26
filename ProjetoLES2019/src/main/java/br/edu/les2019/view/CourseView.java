package br.edu.les2019.view;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;

public class CourseView implements IViewHelper 
{

	@Override
	public EntityDomain getEntity(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

	}

}
