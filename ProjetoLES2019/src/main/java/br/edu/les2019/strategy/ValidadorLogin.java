package br.edu.les2019.strategy;

import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorLogin extends AbstractStrategy
{	@Override public String process(EntityDomain ed) 
	{	Client client = (Client)ed;
		ClientDAO cdao = new ClientDAO();
		List<EntityDomain> entities = new ArrayList<>();
		entities.addAll(cdao.search());
		for(EntityDomain entity:entities)
		{	Client cli = (Client)entity;
			if(cli.getEmails() != null)
			{	if(cli.getEmails().get(0).equals(client.getEmails().get(0)) &&
					cli.getPassword().equals(client.getPassword()))
				{return null;}
			}
		}
		return "E-mail ou senha inválidos";
	}
}