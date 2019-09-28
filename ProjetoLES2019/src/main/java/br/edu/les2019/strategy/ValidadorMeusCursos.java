package br.edu.les2019.strategy;

import java.util.List;

import br.edu.les2019.dao.CarDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.dao.ItemDAO;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;
import br.edu.les2019.domain.ShopCar;

public class ValidadorMeusCursos extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	IDAO idao = new ItemDAO();
		IDAO cadao = new CarDAO();
		ShopCar sc = (ShopCar)ed;
		List<EntityDomain> list = idao.search(sc.getClient());
		List<EntityDomain> list2 = cadao.search(sc.getClient());
 		if(list != null && !list.isEmpty())
		{	for(EntityDomain e:list)
			{	Item item = (Item)e;
				if(item.getCourse().getId() == sc.getCourses().get(0).getId())
				{return "Curso já consta na sua lista!";}
			}
			int i = 0;
			for(EntityDomain e2:list2)
			{	ShopCar sc2 = (ShopCar)e2;
				if(sc2.getCourses().get(i).getId() == sc.getCourses().get(0).getId())
				{return "Curso já consta no seu carrinho!";}
				i++;
			}
		}
			
		return null;
	}
}