package br.edu.les2019.domain;

import java.util.List;

public class ShopCar extends EntityDomain 
{	List<Course> courses;
	Double total;
	
	public Double getTotal() {return total;}
	public void setTotal(Double total) {this.total = total;}
	
	public List<Course> getCourses() {return courses;}
	public void setCourses(List<Course> courses) {this.courses = courses;}
}