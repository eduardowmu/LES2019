package br.edu.les2019.domain;

import java.util.Date;

public class CreditCard extends EntityDomain
{	String banner;
	String number;
	String code;
	Date deadline;
	
	public String getBanner() {return banner;}
	public void setBanner(String banner) {this.banner = banner;}
	
	public String getNumber() {return number;}
	public void setNumber(String number) {this.number = number;}
	
	public String getCode() {return code;}
	public void setCode(String code) {this.code = code;}
	
	public Date getDeadline() {return deadline;}
	public void setDeadline(Date deadline) {this.deadline = deadline;}
}