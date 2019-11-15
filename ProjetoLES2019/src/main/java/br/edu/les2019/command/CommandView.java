package br.edu.les2019.command;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;
public class CommandView extends AbstractCommand 
{	@Override
	public Result execute(EntityDomain ed) 
	{return this.facade.view(ed);}
}