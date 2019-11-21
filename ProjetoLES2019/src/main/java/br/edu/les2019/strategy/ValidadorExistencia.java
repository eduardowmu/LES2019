package br.edu.les2019.strategy;

import java.util.List;

import javax.smartcardio.Card;

import br.edu.les2019.dao.CarDAO;
import br.edu.les2019.dao.CardDAO;
import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.ShopCar;

public class ValidadorExistencia extends AbstractStrategy 
{	IDAO dao = null;
	@Override public String process(EntityDomain ed) 
	{	if(ed instanceof Client)
		{	Client client = (Client)ed;
			dao = new ClientDAO();
			List<EntityDomain> entities = dao.search();
			for(EntityDomain entity:entities)
			{	Client cli = (Client)entity;
				if(client.getCpf().equals(cli.getCpf()))
				{return "Client already exist with cpf " + client.getCpf();}
				
				for(String email:cli.getEmails())
				{	if(client.getEmails().get(0).equals(email))
					{return "Usuário já existente";}
				}
			}
			return null;
		}
	
		else if(ed instanceof Course)
		{	dao = new CourseDAO();
			for(EntityDomain entity:dao.search())
			{	if(entity.getName().equals(ed.getName()))
					return "Curso com nome já existente";
			}
		}
	
		else if(ed instanceof CreditCard)
		{	dao = new CardDAO();
			List<EntityDomain> cards = dao.search(ed.getClient());
			CreditCard card = (CreditCard)ed;
			if(cards != null && !cards.isEmpty())
			{	for(EntityDomain entity:cards)
				{	if(entity != null)
					{	CreditCard c = (CreditCard)entity;
						if(c.getNumber().equalsIgnoreCase(card.getNumber()))
						{return "Cartão já existente";}
					}
				}
			}
		}
	
		return null;
	}
}