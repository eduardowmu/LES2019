package br.edu.fatec2019.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class AlterarCliente2 
{	public static void main(String[] args) 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		Thread thread = new Thread();
		if(driver!=null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/principal.html");
		    driver.manage().window().setSize(new Dimension(1382, 744));
		    driver.findElement(By.id("aluno")).click();
		    driver.findElement(By.id("email")).clear();
		    driver.findElement(By.id("email")).sendKeys("yyy@gmail.com");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("senha")).click();
			driver.findElement(By.id("senha")).clear();
		    driver.findElement(By.id("senha")).sendKeys("!@#Abc123");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("action")).click();
		    driver.findElement(By.linkText("Dados Pessoais")).click();
		    driver.findElement(By.name("nome")).click();
		    driver.findElement(By.name("nome")).clear();
		    driver.findElement(By.name("nome")).sendKeys("yyya");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("sobrenome")).click();
			driver.findElement(By.name("sobrenome")).clear();
		    driver.findElement(By.name("sobrenome")).sendKeys("zzzb");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("fone")).click();
			driver.findElement(By.id("fone")).clear();
		    driver.findElement(By.id("fone")).sendKeys("999999998");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("email")).click();
			driver.findElement(By.id("email")).clear();
		    driver.findElement(By.id("email")).sendKeys("yyya@gmail.com");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("cardName")).click();
			driver.findElement(By.id("cardName")).clear();
		    driver.findElement(By.id("cardName")).sendKeys("yyyyazzzb");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("action")).click();
			try {thread.sleep(3000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.close();
		}
	}
}
