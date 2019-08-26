package br.edu.les2019.strategy;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorDados extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	if(ed.getName().equals(""))
			return "Sem nome";
		
		return null;
	}
}
