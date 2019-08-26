package br.edu.les2019.command;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;

public class LoginCommand extends AbstractCommand 
{	@Override public Result execute(EntityDomain ed) 
	{return facade.login(ed);}
}