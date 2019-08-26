package br.edu.les2019.strategy;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.edu.les2019.domain.EntityDomain;

public class RegistrarData extends AbstractStrategy 
{	@Override public String process(EntityDomain ed) 
	{	ed.setRegistry(new java.util.Date(System.currentTimeMillis()));
		return null;
	}
}