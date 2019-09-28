package br.edu.les2019.domain;

public class Item extends EntityDomain 
{	Course course;
	ShopCar scar;
	String code;
	Sale sale;
	
	public Item() {}
	
	public Item(Course course, String code) 
	{	this.course = course;
		this.code = code;
	}

	public ShopCar getScar() {return scar;}
	public void setScar(ShopCar scar) {this.scar = scar;}
	
	public Course getCourse() {return course;}
	public void setCourse(Course course) {this.course = course;}

	public String getCode() {return code;}
	public void setCode(String code) {this.code = code;}

	public Sale getSale() {return sale;}
	public void setSale(Sale sale) {this.sale = sale;}
}