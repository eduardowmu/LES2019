package br.edu.les2019.domain;

import java.util.Date;

public class CursoVenda extends EntityDomain 
{	String curso;
	Double totalVenda;
	Double totalCurso;
	Double grupo;
	Date registry;
	
	public String getCurso() {return curso;}
	public void setCurso(String curso) {this.curso = curso;}
	
	public Double getTotalVenda() {return totalVenda;}
	public void setTotalVenda(Double totalVenda) {this.totalVenda = totalVenda;}
	
	public Double getTotalCurso() {return totalCurso;}
	public void setTotalCurso(Double totalCurso) {this.totalCurso = totalCurso;}
	
	public Double getGrupo() {return grupo;}
	public void setGrupo(Double grupo) {this.grupo = grupo;}
	
	public Date getRegistry() {return registry;}
	public void setRegistry(Date registry) {this.registry = registry;}
}