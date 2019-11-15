package br.edu.les2019.domain;

import java.util.Timer;

public class Video extends EntityDomain 
{	Double time;
	String link;
	String title;
	String description;
	Course course;
	
	public Double getTime() {return time;}
	public void setTime(Double time) {this.time = time;}
	
	public String getLink() {return link;}
	public void setLink(String link) {this.link = link;}
	
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	
	public Course getCourse() {return course;}
	public void setCourse(Course course) {this.course = course;}
	
	public String getDescription() {return description;}
	public void setDescription(String description) {this.description = description;}
}