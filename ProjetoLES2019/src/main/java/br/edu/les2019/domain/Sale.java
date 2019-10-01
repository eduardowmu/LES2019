package br.edu.les2019.domain;

import java.text.DecimalFormat;
import java.util.List;

public class Sale extends EntityDomain 
{	List<Item> listItem;
	Double total;
	String saleStatus;
	Payment payment;
	String code;
	
	public Sale() {}
	
	public Sale(List<Item> listItem, Double total, String code,
		String saleStatus, Client client, Payment payment) 
	{	this.listItem = listItem;
		this.total = total;
		this.saleStatus = saleStatus;
		this.client = client;
		this.payment = payment;
		this.code = code;
	}
	
	public String getSaleStatus() {return saleStatus;}
	public void setSaleStatus(String saleStatus) 
	{this.saleStatus = saleStatus;}

	public List<Item> getListItem() {return listItem;}
	public void setListItem(List<Item> listItem) {this.listItem = listItem;}
	
	public Double getTotal() {return total;}
	public void setTotal(Double total) {this.total = total;}
	
	public Payment getPayment() {return payment;}
	public void setPayments(Payment payment) {this.payment = payment;}

	public String getCode() {return code;}
	public void setCode(String code) {this.code = code;}

	public String RealFormat(Double total)
	{	DecimalFormat nf = new DecimalFormat("#,##0.00");
		return nf.format(total);
	}
}