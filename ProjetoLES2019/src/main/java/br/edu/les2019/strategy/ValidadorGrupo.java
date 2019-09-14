package br.edu.les2019.strategy;

import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorGrupo extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Course course = (Course)ed;
		if(!course.getGrupoP().equals(""))
			return null;
		
		return "Curso sem grupo de precificação definido";
	}
}