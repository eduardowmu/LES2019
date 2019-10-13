package br.edu.les2019.strategy;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorCartao extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Client client = null;
		if(ed instanceof Client)	client = (Client)ed;
		else client = ed.getClient();
		for(int i = 0; i < client.getCards().size(); i++)
		{	if(client.getCards().get(i).getBanner().equals("") &&
				client.getCards().get(i).getCode().equals("") &&
				client.getCards().get(i).getName().equals("") &&
				client.getCards().get(i).getNumber().equals(""))
			{return "Invalid card";}
		}
		/*if(client.getCard().getBanner().equals("") && 
			client.getCard().getCode().equals("") &&
			client.getCard().getName().equals("") &&
			client.getCard().getNumber().equals(""))
		{return "Invalid card";}*/
		
		return null;
	}
}
