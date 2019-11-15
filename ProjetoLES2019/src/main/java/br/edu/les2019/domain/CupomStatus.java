package br.edu.les2019.domain;

public class CupomStatus extends EntityDomain 
{	int qtd;
	String status;
	
	public int getQtd() {return qtd;}
	public void setQtd(int qtd) {this.qtd = qtd;}
	
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
}