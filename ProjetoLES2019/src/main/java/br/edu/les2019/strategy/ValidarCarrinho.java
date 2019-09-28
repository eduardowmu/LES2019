package br.edu.les2019.strategy;

import br.edu.les2019.dao.CarDAO;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.ShopCar;

public class ValidarCarrinho extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	ShopCar scar = (ShopCar)ed;
		CarDAO cadao = new CarDAO();
		if(cadao.search(scar.getClient()) == null)
			cadao.save(scar);
		return null;
	}
}