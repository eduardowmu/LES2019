package br.edu.les2019.domain;

public class Phone extends EntityDomain
{	String number;
	String ddd;
	String type;
	Client client;
	
	public String getNumber() {return number;}
	public void setNumber(String number) {this.number = number;}
	
	public String getDdd() {return ddd;}
	public void setDdd(String ddd) {this.ddd = ddd;}
	
	public String getType() {return type;}
	public void setType(String type) {this.type = type;}
	
	public Client getClient() {return client;}
	public void setClient(Client client) {this.client = client;}
	
	@Override public String toString() 
	{return "(" + ddd + ")" + number + " type= " + type;}
}