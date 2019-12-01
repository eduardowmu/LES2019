package br.edu.les2019.domain;

import java.util.Date;

public class Cupom extends EntityDomain 
{	Double value;
	String tipo;
	String codigo;
	String status;
	Item item;
	Motivo motivo;
	Sale sale;
	
	public Cupom() {}
	
	public Cupom(Double value, String tipo, String codigo, 
		String status, Client client, Item item, Motivo motivo) 
	{	this.value = value;
		this.tipo = tipo;
		this.codigo = codigo;
		this.status = status;
		this.client = client;
		this.item = item;
		this.motivo = motivo;
	}
	
	public Double getValue() {return value;}
	public void setValue(Double value) {this.value = value;}
	
	public String getTipo() {return tipo;}
	public void setTipo(String tipo) {this.tipo = tipo;}
	
	public String getCodigo() {return codigo;}
	public void setCodigo(String codigo) {this.codigo = codigo;}

	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}

	public Item getItem() {return item;}
	public void setItem(Item item) {this.item = item;}

	public Motivo getMotivo() {return motivo;}
	public void setMotivo(Motivo motivo) {this.motivo = motivo;}

	public Sale getSale() {return sale;}
	public void setSale(Sale sale) {this.sale = sale;}
}