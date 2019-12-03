package br.edu.les2019.strategy;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Payment;
import br.edu.les2019.domain.Sale;

public class ValidarVendaCartao extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Sale sale = (Sale)ed;
		for(int i = 0; i < sale.getPayment().getPaymap().size(); i++)
		{	if(sale.getPayment().getPaymap().get(sale.getClient().getCards().get(i)) != null)
			{	if(sale.getPayment().getPaymap().get(sale.getClient().getCards().get(i)) < 10)
				{return "Valor mínimo para cada cartão deverá ser R$10,00. ";}
				
				return null;
			}
		}
		return "Cada cartão deverá ter uma valor mínimo de R$10,00. ";
	}
}