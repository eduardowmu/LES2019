package br.edu.les2019.domain;

public class CreditCard extends EntityDomain
{	String banner;
	String number;
	String code;
	Client client;
	
	public String getBanner() {return banner;}
	public void setBanner(String banner) {this.banner = banner;}
	
	public String getNumber() {return number;}
	public void setNumber(String number) {this.number = number;}
	
	public String getCode() {return code;}
	public void setCode(String code) {this.code = code;}
	
	public Client getClient() {return client;}
	public void setClient(Client client) {this.client = client;}
}