package br.edu.les2019.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.openqa.selenium.json.Json;

import br.edu.les2019.dao.IDAO;
import br.edu.les2019.dao.ReportDAO;

public class ReportCoursesSold extends EntityDomain 
{	Date startDate;			//data inicio da consulta
	Date endDate;			//data fim da consulta
	List<Categoria> categorias;
	List<CupomStatus> cupons;
	
	public ReportCoursesSold(Date startDate, Date endDate)
	{	this.startDate = startDate;
		this.endDate = endDate;
	}

	public Date getStartDate() {return startDate;}
	public void setStartDate(Date startDate) {this.startDate = startDate;}

	public Date getEndDate() {return endDate;}
	public void setEndDate(Date endDate) {this.endDate = endDate;}

	public List<Categoria> getCategorias() {return categorias;}
	public void setCategorias(List<Categoria> categorias) {this.categorias = categorias;}

	public List<CupomStatus> getCupons() {return cupons;}
	public void setCupons(List<CupomStatus> cupons) {this.cupons = cupons;}
}