package br.edu.les2019.strategy;

import br.edu.les2019.domain.EntityDomain;

public class ValidarCursoId extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	if(ed.getId() > 0)	return null;
	
		else return "Curso inválido. ";
	}
}