package br.edu.les2019.domain;

import java.util.Date;
import java.util.List;

public class Client extends EntityDomain
{	Image img;
	String surname;
	String genero;
	String cpf;
	String status;
	List<String> emails;
	String password, password2;
	Date birthday;
	Phone phone;
	User user;
	List<CreditCard> cards;
	Item item;
	List<Sale> sales;
	//Sale sale;
	ShopCar scar;
	List<Cupom> cupons;
	
	public Image getImg() {return img;}
	public void setImg(Image img) {this.img = img;}
	
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
	
	public Item getItem() {return item;}
	public void setItem(Item item) {this.item = item;}
	/*
	public Sale getSale() {return sale;}
	public void setSale(Sale sale) {this.sale = sale;}
	*/
	public ShopCar getScar() {return scar;}
	public void setScar(ShopCar scar) {this.scar = scar;}
	
	public List<CreditCard> getCards() {return cards;}
	public void setCards(List<CreditCard> cards) {this.cards = cards;}
	
	public List<Sale> getSales() {return sales;}
	public void setSales(List<Sale> sales) {this.sales = sales;}
	
	public List<Cupom> getCupons() {return cupons;}
	public void setCupons(List<Cupom> cupons) {this.cupons = cupons;}
	
	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
}