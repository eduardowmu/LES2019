package br.edu.fatec2019.tests;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class CadastrarCliente 
{	public static void main(String[] args) 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		Thread thread = new Thread();
		if(driver!=null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/principal.html");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.manage().window().maximize();
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.findElement(By.linkText("Tour")).click();
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.get("http://localhost:8080/ProjetoLES2019/cursos.jsp");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.findElement(By.linkText("Quero me cadastrar"));
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.get("http://localhost:8080/ProjetoLES2019/cadastroUsuarios.jsp");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.findElement(By.name("nome")).sendKeys("Alex");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("sobrenome")).sendKeys("Silva");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("cpf")).sendKeys("80462086046");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("ddd")).click();
		    driver.findElement(By.id("ddd")).sendKeys("11");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("fone")).click();
		    driver.findElement(By.id("fone")).sendKeys("999999999");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			//driver.findElement(By.name("dtnasc")).click();
		    //driver.findElement(By.name("dtnasc")).click();
		    //DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		    //Calendar calender = Calendar.getInstance();
		    driver.findElement(By.name("dtnasc")).sendKeys("01");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("dtnasc")).sendKeys("01");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("dtnasc")).sendKeys("1999");
		    
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("email")).click();
		    driver.findElement(By.id("email")).sendKeys("alex@gmail.com");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("cardName")).click();
		    driver.findElement(By.id("cardName")).sendKeys("Alex Silva");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("cardNumber")).sendKeys("1023045680799074");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("seg")).click();
		    driver.findElement(By.id("seg")).sendKeys("123");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.findElement(By.id("prazo")).sendKeys("12");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("prazo")).sendKeys("12");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("prazo")).sendKeys("2024");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("pass")).click();
		    driver.findElement(By.id("pass")).sendKeys("!@#Abc123");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("pass2")).sendKeys("!@#Abc123");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("action")).click();
			try {thread.sleep(2000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.close();
		}
	}
}