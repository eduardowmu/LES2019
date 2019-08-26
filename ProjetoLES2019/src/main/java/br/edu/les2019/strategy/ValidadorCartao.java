package br.edu.les2019.strategy;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorCartao extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Client client = (Client)ed;
		if(client.getCard().getBanner().equals("") && 
			client.getCard().getCode().equals("") &&
			client.getCard().getName().equals("") &&
			client.getCard().getNumber().equals(""))
		{return "Invalid card";}
		
		return null;
	}
}
