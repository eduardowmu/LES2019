package br.edu.les2019.strategy;

import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Sale;

public class ValidadorParcelas extends AbstractStrategy
{	@Override public String process(EntityDomain ed) 
	{	Sale sale = (Sale)ed;
		double soma = 0.0;
		for(int i = 0; i < sale.getClient().getCards().size(); i++)
		{	if(sale.getPayment().getPaymap().get(sale.getClient().getCards().get(i)) != null)
			{soma += sale.getPayment().getPaymap().get(sale.getClient().getCards().get(i));}
		}
		
		if(soma != sale.getTotal())	return "A soma das parcelas não totalizam o preço de venda. ";
		
		return null;
	}
}