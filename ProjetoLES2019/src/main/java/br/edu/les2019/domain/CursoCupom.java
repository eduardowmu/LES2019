package br.edu.les2019.domain;

public class CursoCupom extends EntityDomain 
{	String curso;
	int qtd;
	
	public String getCurso() {return curso;}
	public void setCurso(String curso) {this.curso = curso;}
	
	public int getQtd() {return qtd;}
	public void setQtd(int qtd) {this.qtd = qtd;}
}