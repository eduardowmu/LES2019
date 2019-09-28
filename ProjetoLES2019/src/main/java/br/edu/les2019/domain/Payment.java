package br.edu.les2019.domain;

import java.util.List;

public class Payment extends EntityDomain 
{	CreditCard card;
	int qtdParcelas;
	Double valor;
	String status;
	Sale sale;
	
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	
	public CreditCard getCard() {return card;}
	public void setCard(CreditCard card) {this.card = card;}
	
	public Double getValor() {return valor;}
	public void setValor(Double valor) {this.valor = valor;}
	
	public Sale getSale() {return sale;}
	public void setSale(Sale sale) {this.sale = sale;}
	
	public int getQtdParcelas() {return qtdParcelas;}
	public void setQtdParcelas(int qtdParcelas) 
	{this.qtdParcelas = qtdParcelas;}
}