package br.edu.les2019.strategy;

import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;

public class ValidarCurso extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Course course = (Course)ed;
		if(course.getName().equals("") && course.getInstructor().equals("") &&
			course.getCategoria().equals("") && course.getId() == 0)
		return "Não foi possível encontrar resultado da busca";
		
		return null;
	}

}
