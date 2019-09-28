package br.edu.les2019.facade;

import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.result.Result;

public interface IFacade 
{	public abstract Result save(EntityDomain ed);
	public abstract Result update(EntityDomain ed);
	public abstract Result delete(EntityDomain ed);
	public abstract Result search(EntityDomain ed);
	public abstract Result login(EntityDomain ed);
	public abstract Result show(EntityDomain ed);
	public abstract Result view(EntityDomain ed);
}
