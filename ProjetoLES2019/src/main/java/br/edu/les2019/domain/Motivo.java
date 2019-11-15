package br.edu.les2019.domain;

public class Motivo extends EntityDomain 
{	String text;

	public Motivo(String text) {this.text = text;}

	public String getText() {return text;}
	public void setText(String text) {this.text = text;}
}