package br.edu.fatec2019.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class AlterarCliente 
{	public static void main(String[] args) 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		Thread thread = new Thread();
		if(driver!=null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/login.jsp");
		    driver.manage().window().maximize();
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("email")).sendKeys("dddeee@gmail.com");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("senha")).sendKeys("!@#Abc123");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.findElement(By.id("action")).click();
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.get("http://localhost:8080/ProjetoLES2019/meusCursos2.jsp");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.findElement(By.linkText("| Dados Pessoais |")).click();
		    driver.findElement(By.name("nome")).click();
		    driver.findElement(By.name("nome")).clear();
		    driver.findElement(By.name("nome")).sendKeys("dd2");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("sobrenome")).click();
			driver.findElement(By.name("sobrenome")).clear();
		    driver.findElement(By.name("sobrenome")).sendKeys("ee2");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("email")).click();
			driver.findElement(By.id("email")).clear();
		    driver.findElement(By.id("email")).sendKeys("dde@gmail.com");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("cardName")).click();
			driver.findElement(By.id("cardName")).clear();
		    driver.findElement(By.id("cardName")).sendKeys("dd2ee2");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("action")).click();
			try {thread.sleep(3000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.close();
		}
	}
}
