package br.edu.les2019.domain;

import java.util.Date;

public abstract class EntityDomain 
{	Integer id;
	String name;
	String photo;
	Date registry;
	Client client;
	
	public Integer getId() {return id;}
	public void setId(Integer id) {this.id = id;}
	
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	public Date getRegistry() {return registry;}
	public void setRegistry(Date registry) {this.registry = registry;}
	
	public String getPhoto() {return photo;}
	public void setPhoto(String photo) {this.photo = photo;}
	
	public Client getClient() {return client;}
	public void setClient(Client client) {this.client = client;}
}