package br.edu.les2019.strategy;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Phone;

public class ValidadorPhone extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Client client = (Client)ed;
		if((client.getPhone().getNumber().length() == 8 && 
			client.getPhone().getType().equalsIgnoreCase("fixo")) || 
			(client.getPhone().getNumber().length() == 9 && 
			client.getPhone().getType().equalsIgnoreCase("movel")) &&
			client.getPhone().getDdd().length() == 2)
		{return null;}
		
		else return "Invalid phone number";
	}
}