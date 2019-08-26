package br.edu.les2019.domain;

import java.util.Date;
import java.util.List;

public class Client extends EntityDomain
{	String surname;
	String genero;
	String cpf;
	List<String> emails;
	String password, password2;
	Date birthday;
	Phone phone;
	User user;
	CreditCard card;
	
	public String getSurname() {return surname;}
	public void setSurname(String surname) 
	{this.surname = surname;}
	
	public String getCpf() {return cpf;}
	public void setCpf(String cpf) {this.cpf = cpf;}
	
	public List<String> getEmails() {return emails;}
	public void setEmails(List<String> emails) {this.emails = emails;}
	
	public String getPassword() {return password;}
	public void setPassword(String password) {this.password = password;}
	
	public String getPassword2() {return password2;}
	public void setPassword2(String password2) {this.password2 = password2;}
	
	public User getUser() {return user;}
	public void setUser(User user) {this.user = user;}
	
	public String getGenero() {return genero;}
	public void setGenero(String genero) {this.genero = genero;}
	
	public Date getBirthday() {return birthday;}
	public void setBirthday(Date birthday) {this.birthday = birthday;}
	
	public Phone getPhone() {return phone;}
	public void setPhone(Phone phone) {this.phone = phone;}
	
	public CreditCard getCard() {return card;}
	public void setCard(CreditCard card) {this.card = card;}
}