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
	DateFormat df = new SimpleDateFormat("yyyy-MM");
	if(result != null)
	{	if(result.getEntities() != null && !result.getEntities().isEmpty())
		{	for(EntityDomain ed:result.getEntities())
			{	if(ed instanceof ReportCoursesSold)
				{	rcs = (ReportCoursesSold)ed;
					if(rcs != null)
					{	for(CursoVenda cv:rcs.getVendas())
						{	empObj = new JSONObject();
							empObj.put("Venda", cv.getTotalVenda());
							empObj.put("Custo", cv.getTotalCurso());
							empObj.put("Data", df.format(cv.getRegistry()));
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