package br.edu.les2019.strategy;

import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorCategoria extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Course course = (Course)ed;
		if(!course.getCategoria().equals(""))
			return null;
		
		return "Categoria não definido. ";
	}
}