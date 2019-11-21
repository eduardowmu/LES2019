package br.edu.fatec2019.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class AlterarSenha 
{	public static void main(String[] args) 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		Thread thread = new Thread();
		if(driver!=null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/login.jsp");
			try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.manage().window().maximize();
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.linkText("Esqueceu a senha?")).click();
			try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/alterar_senha.jsp");
			try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("email")).sendKeys("eeefff@gmail.com");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("senha")).sendKeys("@#$Abc123");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.findElement(By.id("senha2")).sendKeys("@#$Abc123");
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		    driver.findElement(By.id("action")).click();
		    try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
		}
	}
}