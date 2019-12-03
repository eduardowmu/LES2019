package br.edu.les2019.strategy;

import java.util.List;

import javax.smartcardio.Card;

import br.edu.les2019.dao.CarDAO;
import br.edu.les2019.dao.CardDAO;
import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.dao.ItemDAO;
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
			if(entities != null && !entities.isEmpty())
			{	for(EntityDomain entity:entities)
				{	Client cli = (Client)entity;
					if(client.getCpf().equals(cli.getCpf()))
					{return "Cliente já existe com cpf " + client.getCpf();}
					
					for(String email:cli.getEmails())
					{	if(client.getEmails().get(0).equals(email))
						{return "Usuário já existente";}
					}
				}
			}
			return null;
		}
	
		else if(ed instanceof Course)
		{	dao = new CourseDAO();
			for(EntityDomain entity:dao.search())
			{	if(entity.getName().equals(ed.getName()))
					return "Curso com nome já existente. ";
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
						{return "Cartão já existente. ";}
					}
				}
			}
		}
	
		else if(ed instanceof ShopCar)
		{	dao = new CarDAO();
			ShopCar car = (ShopCar)ed;
			List<EntityDomain> cars = dao.search(ed.getClient());
			if(cars != null && !cars.isEmpty())
			{	for(EntityDomain e:cars)
				{	ShopCar c = (ShopCar)e;
					for(int i = 0; i < c.getCourses().size(); i++)
					{	if(car.getCourses().get(0).getId() == c.getCourses().get(i).getId())
						{return "O curso já existe em seu carrinho! ";}
					}
				}
			}
			
			ItemDAO idao = new ItemDAO();
			List<Course> courses = idao.searchClientCourse(car.getClient());
			if(courses != null && !courses.isEmpty())
			{	for(Course course:courses)
				{	for(Course cc:car.getCourses())
					{	if(cc.getId() == course.getId())
						{return "O curso " + cc.getName() + " já existe em sua conta";}
					}
				}
			}
		}
	
		return null;
	}
}