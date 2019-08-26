package br.edu.les2019.result;

import java.util.ArrayList;
import java.util.List;

import br.edu.les2019.domain.EntityDomain;

public class Result 
{	private String msg;//return mg to client, after a request
	//Entities list
	private List<EntityDomain> entities;
	
	//getters e setters
	public String getMsg() {return msg;}
	public void setMsg(String msg) {this.msg = msg;}
	
	public List<EntityDomain> getEntities() {return entities;}
	public void setEntities(List<EntityDomain> entities) 
	{this.entities = entities;}
	
	/*this method add any Entity inherited from EntityDomain*/
	public void addEntity(EntityDomain ed)
	{	if(this.entities == null)
		{this.entities = new ArrayList<EntityDomain>();}
		
		this.entities.add(ed);
	}
}