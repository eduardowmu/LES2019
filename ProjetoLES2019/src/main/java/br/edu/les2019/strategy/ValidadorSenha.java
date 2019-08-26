package br.edu.les2019.strategy;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorSenha extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	Client client = (Client)ed;
		String esp = "!?@#$%&*()_-=/*+,.^;{}´[]ªº~";//string de characteres especiais
		String low = "qwertyuiopasdfghjklzxcvbnmç";//string de alfabeto
		int e = 0;//quantidade de caracteres especiais
		int l = 0;//qtdade de letras minusculas
		int u = 0;//letras maiusculas
		if(client.getPassword().length() >= 8)
		{	for(int i = 0; i < esp.length(); i++)
			{	if(client.getPassword().contains(String.valueOf(esp.charAt(i))))
				{e++;}
			}
			
			for(int i = 0; i < low.length(); i++)
			{	if(client.getPassword().contains(String.valueOf(low.charAt(i))))
				{l++;}
			}
				
			for(int i = 0; i < low.toUpperCase().length(); i++)
			{	if(client.getPassword().contains(String.valueOf(low.toUpperCase().charAt(i))))
				{u++;}
			}
				
			if((e > 0 && l > 0 && u > 0))	return null;
		}
		return "Senha inválida! No mínimo 8 caracteres, 1 letra minúscula e maiúscula e 1 caractere especial. Ex: !@#$%¨&*.\n";
	}
}