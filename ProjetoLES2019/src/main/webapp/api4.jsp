<%@page import="java.util.*" %>
<%@page import="org.json.*"%>
<%@page import="java.util.*, br.edu.les2019.domain.*" %>
<%@page import="java.util.*, br.edu.les2019.result.*" %>
<%@page import = "java.text.*"%>
<%	Result result = (Result)session.getAttribute("result");
	ReportCoursesSold rcs = null;
	List empdetails = new LinkedList();
	JSONObject responseObj = new JSONObject();
	JSONObject empObj = null;
	if(result != null)
	{	if(result.getEntities() != null && !result.getEntities().isEmpty())
		{	for(EntityDomain ed:result.getEntities())
			{	if(ed instanceof ReportCoursesSold)
				{	rcs = (ReportCoursesSold)ed;
					if(rcs != null)
					{	for(CursoCupom cc:rcs.getCursosCupom())
						{	empObj = new JSONObject();
							empObj.put("Curso", cc.getCurso());
							empObj.put("Qtd", cc.getQtd());
							empdetails.add(empObj);
						}
					}
					responseObj.put("empdetails", empdetails);
					out.print(responseObj.toString());
				}
			}
		}
	}
%>