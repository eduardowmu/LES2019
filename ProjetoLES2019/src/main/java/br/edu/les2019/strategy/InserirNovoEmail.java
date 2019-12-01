package br.edu.les2019.strategy;


import java.util.List;

import br.edu.les2019.dao.EmailDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Sale;

public class InserirNovoEmail extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Sale sale = (Sale)ed;
		if(sale.getClient().getEmails().get(sale.getClient().getEmails().size() - 1).equals(""))
		{return null;}
		
		EmailDAO dao = new EmailDAO();
		List<EntityDomain> entities = dao.search(sale.getClient());
		if(entities != null && !entities.isEmpty())
		{	for(EntityDomain e:entities)
			{	Client client = (Client)e;
				for(int i = 0; i < sale.getClient().getEmails().size(); i++)
				{	if(!client.getEmails().contains(sale.getClient().getEmails().get(i)))
					{dao.saveEmail(sale.getClient(), i);}
				}
			}
		}
		if(dao.isSave())	return null;
		
		else return "Não foi possível salvar este e-mail. ";
	}
}