package br.edu.les2019.command;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.facade.Facade;
import br.edu.les2019.result.Result;

public class UpdateKeyCommand extends AbstractCommand 
{	@Override public Result execute(EntityDomain ed) 
	{	Facade f = new Facade();
		return f.updateKey(ed);
	}
}