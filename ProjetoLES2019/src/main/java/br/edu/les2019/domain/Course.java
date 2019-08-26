package br.edu.les2019.domain;

import java.util.List;
import java.util.Timer;

public class Course extends EntityDomain 
{	List<Client> clients;
	Double price;
	List<Video> videos;
	
	public List<Client> getClients() {return clients;}
	public void setClients(List<Client> clients) {this.clients = clients;}
	
	public Double getPrice() {return price;}
	public void setPrice(Double price) {this.price = price;}
	
	public List<Video> getVideos() {return videos;}
	public void setVideos(List<Video> videos) {this.videos = videos;}
}