<%@page import="java.util.*" %>
<%@page import="org.json.*"%>
<%@ page import="java.util.*, br.edu.les2019.domain.*" %>
<%@ page import="java.util.*, br.edu.les2019.result.*" %>
<%@ page import = "java.text.*"%>
<% 	Result result = (Result)session.getAttribute("result");
	ReportCoursesSold rcs = null;
	List empdetails = new LinkedList();
	JSONObject responseObj = new JSONObject();
	JSONObject empObj = null;
	if(result != null)
	{	if(result.getEntities() != null && !result.getEntities().isEmpty())
		{	for(EntityDomain ed:result.getEntities())
			{	if(ed instanceof ReportCoursesSold)
				{	rcs = (ReportCoursesSold)ed;
					for(Categoria c:rcs.getCategorias())
					{	empObj = new JSONObject();
						empObj.put("Categoria", c.getName());
						empObj.put("Quantidade", c.getQtd());
						empdetails.add(empObj);
					}
					responseObj.put("empdetails", empdetails);
					out.print(responseObj.toString());
				}
			}
		}
	}
	
//var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
/*
String chart = "{\"type\":\"bar\",\"data\":{\"labels\":[\"january\",\"february\",\"march\",\"april\",\"may\",\"june\",\"july\"],\"datasets\":[{\"label\":\"my first dataset\",\"backgroundcolor\":\"#00f\",\"bordercolor\":\"#00f\",\"data\":[5,2,2,5,3,4,5],\"fill\":false}],\"options\":{\"responsive\":true,\"title\":{\"display\":true,\"text\":\"grafico linha\"},\"tooltips\":{\"mode\":\"index\",\"intersect\":false},\"hover\":{\"mode\":\"nearest\",\"intersect\":true},\"scales\":{\"xaxes\":[{\"display\":true,\"scalelabel\":{\"display\":true,\"labelstring\":\"month\"}}],\"yaxes\":[{\"display\":true,\"scalelabel\":{\"display\":true,\"labelstring\":\"value\"}}]}}}}";

out.print(chart);*/
%>