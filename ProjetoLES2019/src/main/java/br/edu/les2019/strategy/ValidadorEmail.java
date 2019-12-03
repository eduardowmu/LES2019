package br.edu.les2019.strategy;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorEmail extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	if(ed instanceof Client)
		{	Client client = (Client)ed;
			for(String email:client.getEmails())
			{	if(email.contains("@") || email.contains(".com"))
				{return null;}
			}
		}
		return "E-mail inválido. ";
	}
}