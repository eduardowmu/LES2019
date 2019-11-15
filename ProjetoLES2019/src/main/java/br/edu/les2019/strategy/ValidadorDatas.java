package br.edu.les2019.strategy;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.ReportCoursesSold;

public class ValidadorDatas extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	ReportCoursesSold rcs = (ReportCoursesSold)ed;
		if(rcs.getStartDate() != null && rcs.getEndDate() != null)
			return null;
		
		else return "Data de início ou fim inválida!";
	}
} 