package br.edu.les2019.domain;

import java.util.Date;

public class Cupom extends EntityDomain 
{	Double value;
	Date validate;
	String tipo;
	
	public Double getValue() {return value;}
	public void setValue(Double value) {this.value = value;}
	
	public Date getValidate() {return validate;}
	public void setValidate(Date validate) {this.validate = validate;}
	
	public String getTipo() {return tipo;}
	public void setTipo(String tipo) {this.tipo = tipo;}
}