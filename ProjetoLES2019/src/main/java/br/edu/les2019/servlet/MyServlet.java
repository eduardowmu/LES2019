package br.edu.les2019.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.command.DeleteCommand;
import br.edu.les2019.command.ICommand;
import br.edu.les2019.command.LoginCommand;
import br.edu.les2019.command.SaveCommand;
import br.edu.les2019.command.SearchCommand;
import br.edu.les2019.command.ShowCommand;
import br.edu.les2019.command.UpdateCommand;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;
import br.edu.les2019.view.ClientView;
import br.edu.les2019.view.CourseView;
import br.edu.les2019.view.IViewHelper;
import br.edu.les2019.view.VideoView;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet({ "/MyServlet", "/ClientServlet", "/CourseServlet", "/VideoServlet" })
public class MyServlet extends HttpServlet 
{	private static final long serialVersionUID = 1L;
    //command maps
	private static Map<String, ICommand> commands;
	//view helper maps
	private static Map<String, IViewHelper> views;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet()//creating a map of commands
    {	this.commands = new HashMap<String, ICommand>();
    	this.commands.put("save", new SaveCommand());
    	this.commands.put("update", new UpdateCommand());
    	this.commands.put("delete", new DeleteCommand());
    	this.commands.put("search", new SearchCommand());
    	this.commands.put("login", new LoginCommand());
    	//this.commands.put("show", new ShowCommand());
    	
    	//instanciateing ViewHelper
    	this.views = new HashMap<String, IViewHelper>();
    	//creating a map of Views
    	this.views.put("/ProjetoLES2019/ClientServlet", new ClientView());
    	this.views.put("/ProjetoLES2019/CourseServlet", new CourseView());
    	this.views.put("/ProjetoLES2019/VideoServlet", new VideoView());
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException 
	{this.ProcessRequest(request, response);}
	
	protected void ProcessRequest(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException
	{	IViewHelper vh = views.get(request.getRequestURI());//get the referenced EntityDomain class
		
		//view helper returns the class from request
		EntityDomain entity = vh.getEntity(request);
		
		//get the command from the request
		ICommand command = this.commands.get(request.getParameter("action"));
		
		//command results
		Result result = command.execute(entity);
		
		//returns to client view all results
		vh.setView(result, request, response);
	}
}