package br.edu.les2019.domain;

import java.util.List;
import java.util.Map;

public class Payment extends EntityDomain 
{	Map<CreditCard, Double> paymap;
	//List<CreditCard> cards;
	int qtdParcelas;
	//Double valor;
	String status;
	Sale sale;
	
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	
	/*public List<CreditCard> getCards() {return cards;}
	public void setCards(List<CreditCard> cards) {this.cards = cards;}
	
	public Double getValor() {return valor;}
	public void setValor(Double valor) {this.valor = valor;}*/
	
	public Sale getSale() {return sale;}
	public void setSale(Sale sale) {this.sale = sale;}
	
	public int getQtdParcelas() {return qtdParcelas;}
	public void setQtdParcelas(int qtdParcelas) 
	{this.qtdParcelas = qtdParcelas;}
	
	public Map<CreditCard, Double> getPaymap() {return paymap;}
	public void setPaymap(Map<CreditCard, Double> paymap) 
	{this.paymap = paymap;}
}