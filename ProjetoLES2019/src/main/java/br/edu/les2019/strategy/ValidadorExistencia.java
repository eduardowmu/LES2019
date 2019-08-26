package br.edu.les2019.strategy;

import java.util.List;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorExistencia extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	if(ed instanceof Client)
		{	Client client = (Client)ed;
			ClientDAO cdao = new ClientDAO();
			List<EntityDomain> entities = cdao.search();
			for(EntityDomain entity:entities)
			{	Client cli = (Client)entity;
				if(client.getCpf().equals(cli.getCpf()))
				{return "Client already exist";}
			}
			return null;
		}
		return null;
	}
}