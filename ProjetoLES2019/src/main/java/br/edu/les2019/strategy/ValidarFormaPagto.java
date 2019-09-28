package br.edu.les2019.strategy;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Sale;

public class ValidarFormaPagto extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Sale sale = (Sale)ed;
		
		return null;
	}
}