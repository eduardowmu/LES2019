package br.edu.les2019.strategy;

import br.edu.les2019.domain.EntityDomain;

public class ValidadorImagem extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	if(!ed.getPhoto().isEmpty())
		{	if(ed.getPhoto().contains("jpg") || ed.getPhoto().contains("png"))
			{return null;}
		
			return "Just jpg and png extension are accepted for images";
		}
		
		return null;
	}
}