package br.edu.les2019.domain;

public class ClienteVenda extends EntityDomain 
{	String cliente;
	Double total;
	
	public String getCliente() {return cliente;}
	public void setCliente(String cliente) {this.cliente = cliente;}
	
	public Double getTotal() {return total;}
	public void setTotal(Double total) {this.total = total;}
}