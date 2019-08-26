package br.edu.les2019.strategy;

public abstract class AbstractStrategy implements IStrategy 
{	StringBuilder sb;
	protected String checkMsg()
	{	if(sb.length()>0)//if there any msg 
		{return sb.toString();}//msg sent
		//else
		else return null;
	}
}
