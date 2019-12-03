package br.edu.les2019.strategy;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;

public class ConfirmaSenhas extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Client client = (Client)ed;
		if(client.getPassword().equals(client.getPassword2()))
			return null;
		
		return "Senhas não conferem. ";
	}
}