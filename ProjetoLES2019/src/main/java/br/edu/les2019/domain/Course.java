package br.edu.les2019.domain;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Timer;

public class Course extends EntityDomain 
{	Double price;
	List<Video> videos;
	String status;
	String instructor;
	String categoria;
	String descricao;
	Double valor;
	String grupoP;
	Image img;
	
	public Course()	{}
	
	public Course(int id)	{this.id = id;}
	
	public Image getImg() {return img;}
	public void setImg(Image img) {this.img = img;}
	
	public String getGrupoP() {return grupoP;}
	public void setGrupoP(String grupoP) {this.grupoP = grupoP;}
	
	public Double getPrice() {return price;}
	public void setPrice(Double price) {this.price = price;}
	
	public List<Video> getVideos() {return videos;}
	public void setVideos(List<Video> videos) {this.videos = videos;}
	
	public String getInstructor() {return instructor;}
	public void setInstructor(String instructor) {this.instructor = instructor;}
	
	public String getCategoria() {return categoria;}
	public void setCategoria(String categoria) {this.categoria = categoria;}
	
	public String getDescricao() {return descricao;}
	public void setDescricao(String descricao) {this.descricao = descricao;}
	
	public Double getValor() {return valor;}
	public void setValor(Double valor) {this.valor = valor;}
	
	public String RealFormat(double price)
	{	//Locale local = new Locale("pt", "br");
		DecimalFormat nf = new DecimalFormat("#,##0.00");
		return nf.format(price);
	}

	public String getStatus() {return status;}
	public void setStatus(String status) {this.status = status;}
	
	public double getTotalPrice(double p, String g)
	{	if(g.contains("x1.5"))	return p*1.5;
	
		else if(g.contains("x1.25"))	return p*1.25;
	
		return p*1.15;
	}
}