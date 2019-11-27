package br.edu.les2019.dao;

import java.util.List;
import br.edu.les2019.domain.EntityDomain;

public interface IDAO 
{	public abstract void save(EntityDomain ed);
	public abstract void update(EntityDomain ed);
	public abstract void delete(EntityDomain ed);
	public abstract List<EntityDomain> search(EntityDomain ed);
	public abstract List<EntityDomain> search();
	public abstract void updateKey(EntityDomain ed);
	public abstract void active(EntityDomain ed);
}
