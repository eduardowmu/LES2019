package br.edu.les2019.strategy;

import java.text.ParseException;

import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.EntityDomain;

public class ValidadorCPF extends AbstractStrategy
{	@Override public String process(EntityDomain ed) 
	{	if(ed instanceof Client)
		{	Client client = (Client)ed;
			Integer[] dig = new Integer[11];
			int soma = 0;
			if(this.isNumber(client.getCpf()) && client.getCpf().length() == 11)
			{	for(int i = 0, j = 10; i < client.getCpf().length()-2; i++, j--)
				{	dig[i] = Integer.parseInt(String.valueOf(client.getCpf().charAt(i)));
					soma += (dig[i]*j);
				}
			
				soma %= 11;
				//se soma maior que 1, será 11 - resto
				if(soma > 1)	dig[9] = 11 - soma;
				//senão, será zero
				else dig[9] = 0;
				
				//reinicializa a soma
				soma = 0;
				
				for(int i = 0, j = 11; i < client.getCpf().length()-1; i++, j--)
				{soma += (dig[i]*j);}
				
				soma %= 11;
				if(soma > 1)	dig[10] = 11 - soma;
				else dig[10] = 0;
				if(dig[9] == Integer.parseInt(String.valueOf(client.getCpf().charAt(9))) && 
					dig[10] == Integer.parseInt(String.valueOf(client.getCpf().charAt(10))))
				{return null;}
			}
			return "Invalidate CPF number";
		}
		return "Invalidate CPF number";
	}
	private boolean isNumber(String cpf)
	{	try	
		{	double number = Double.parseDouble(cpf);
			number /= 2;
			return true;
		}
		catch(NumberFormatException e)
		{return false;}
	}
}