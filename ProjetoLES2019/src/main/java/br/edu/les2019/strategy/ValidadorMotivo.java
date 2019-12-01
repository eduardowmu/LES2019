package br.edu.les2019.strategy;

import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorMotivo extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Cupom cupom = (Cupom)ed;
		if(cupom.getMotivo().getText().equals(""))
		{return "É necessário um motivo para obter cupom de troca";}
		
		return null;
	}
}