package br.edu.les2019.domain;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import java.util.Timer;

public class Course extends EntityDomain 
{	Double price;
	List<Video> videos;
	String instructor;
	String categoria;
	String descricao;
	Double valor;
	String grupoP;
	Image img;
	
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
	{	Locale local = new Locale("pt", "br");
		NumberFormat nf = NumberFormat.getCurrencyInstance(local);
		return nf.format(price);
	}
}