package br.edu.les2019.strategy;

import java.util.List;

import br.edu.les2019.dao.ItemDAO;
import br.edu.les2019.dao.SaleCupomDAO;
import br.edu.les2019.domain.Cupom;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Item;

public class ValidadorCupomVenda extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Cupom cupom = (Cupom)ed;
		List<Item> itens = new SaleCupomDAO().searchItens(cupom);
		
		if(itens != null && !itens.isEmpty())
		{return "Já existe cupom de um ou mais itens dessa compra " + cupom.getSale().getCode();}
		
		return null;
	}
}