package br.edu.les2019.domain;

import java.util.List;

public class Ranking extends EntityDomain 
{	List<Integer> codes;
	List<String> clients;	
	List<Double> values;
	
	public List<String> getClients() {return clients;}
	public void setClients(List<String> clients) {this.clients = clients;}
	
	public List<Double> getValues() {return values;}
	public void setValues(List<Double> values) {this.values = values;}
	
	public List<Integer> getCodes() {return codes;}
	public void setCodes(List<Integer> codes) {this.codes = codes;}
}