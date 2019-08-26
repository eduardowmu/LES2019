package br.edu.les2019.domain;

import java.util.List;

public class ShopCar extends EntityDomain 
{	List<Course> courses;
	Client client;
	Double total;
	
	public List<Course> getCourses() {return courses;}
	public void setCourses(List<Course> courses) {this.courses = courses;}
	
	public Client getClient() {return client;}
	public void setClient(Client client) {this.client = client;}
	
	public Double getTotal() {return total;}
	public void setTotal(Double total) {this.total = total;}
}