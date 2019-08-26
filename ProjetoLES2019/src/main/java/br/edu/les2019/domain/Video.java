package br.edu.les2019.domain;

import java.util.Timer;

public class Video extends EntityDomain 
{	Double time;
	String link;
	
	public Double getTime() {return time;}
	public void setTime(Double time) {this.time = time;}
	
	public String getLink() {return link;}
	public void setLink(String link) {this.link = link;}
}