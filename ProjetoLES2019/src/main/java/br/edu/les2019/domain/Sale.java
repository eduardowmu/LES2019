package br.edu.les2019.domain;

import java.text.DecimalFormat;
import java.util.List;

public class Sale extends EntityDomain 
{	List<Item> listItem;
	Double total;
	String saleStatus;
	List<Payment> payments;
	String code;
	
	public Sale() {}
	
	public Sale(List<Item> listItem, Double total, String code,
		String saleStatus, Client client, List<Payment> payments) 
	{	this.listItem = listItem;
		this.total = total;
		this.saleStatus = saleStatus;
		this.client = client;
		this.payments = payments;
		this.code = code;
	}
	
	public String getSaleStatus() {return saleStatus;}
	public void setSaleStatus(String saleStatus) 
	{this.saleStatus = saleStatus;}

	public List<Item> getListItem() {return listItem;}
	public void setListItem(List<Item> listItem) {this.listItem = listItem;}
	
	public Double getTotal() {return total;}
	public void setTotal(Double total) {this.total = total;}
	
	public List<Payment> getPayments() {return payments;}
	public void setPayments(List<Payment> payments) {this.payments = payments;}

	public String getCode() {return code;}
	public void setCode(String code) {this.code = code;}

	public String RealFormat(Double total)
	{	DecimalFormat nf = new DecimalFormat("#,##0.00");
		return nf.format(total);
	}
}