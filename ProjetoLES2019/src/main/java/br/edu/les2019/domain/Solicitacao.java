package br.edu.les2019.domain;

public class Solicitacao extends EntityDomain 
{	String motivo;
	Sale sale;
	Double value;
	String status;
	Cupom cupom;
	Client client;
	
	public String getMotivo() {return motivo;}
	public void setMotivo(String motivo) {this.motivo = motivo;}
	
	public Sale getSale() {return sale;}
	public void setSale(Sale sale) {this.sale = sale;}
	
	public Double getValue() {return value;}
	public void setValue(Double value) {this.value = value;}
	
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	
	public Cupom getCupom() {return cupom;}
	public void setCupom(Cupom cupom) {this.cupom = cupom;}
	
	public Client getClient() {return client;}
	public void setClient(Client client) {this.client = client;}
}