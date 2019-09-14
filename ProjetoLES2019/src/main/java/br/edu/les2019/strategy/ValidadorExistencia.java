package br.edu.les2019.strategy;

import java.util.List;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorExistencia extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	if(ed instanceof Client)
		{	Client client = (Client)ed;
			IDAO cdao = new ClientDAO();
			List<EntityDomain> entities = cdao.search();
			for(EntityDomain entity:entities)
			{	Client cli = (Client)entity;
				if(client.getCpf().equals(cli.getCpf()))
				{return "Client already exist";}
			}
			return null;
		}
	
		else if(ed instanceof Course)
		{	IDAO codao = new CourseDAO();
			for(EntityDomain entity:codao.search())
			{	if(entity.getName().equals(ed.getName()))
					return "Curso com nome já existente";
			}
		}
		return null;
	}
}