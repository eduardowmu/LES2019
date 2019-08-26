package br.edu.fatec2019.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class SecondTest 
{	public static void main(String[] args) 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		
		if(driver!=null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/principal.html");
			driver.manage().window().maximize();
			
			Thread thread = new Thread();
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			
			driver.findElement(By.name("adm")).click();
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/loginAdm.html");
			driver.findElement(By.name("email")).sendKeys("eduardo@gmail.com");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("senha")).sendKeys("Abc123!@#");
			try {thread.sleep(1000);}
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("login")).sendKeys(Keys.ENTER);
			driver.get("http://localhost:8080/ProjetoLES2019/inicialAdm.html");
			try {thread.sleep(5000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("genCursos")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/gerenciarCursos.html");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("novo_curso")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/curso_cadastro.jsp");
			driver.findElement(By.name("titulo")).sendKeys("Angular");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("descricao")).sendKeys("Curso de Angular para iniciantes");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("instrutor")).sendKeys("Daniel San");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("salvar")).click();
			try {thread.sleep(5000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/lista.jsp");
			try {thread.sleep(2000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("addVideo")).click();
			try {thread.sleep(5000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/videos.jsp");
			try {thread.sleep(2000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			for(int i = 0; i < 5; i++)
			{	driver.findElement(By.name("titulo")).sendKeys("Video " + (i+1));	
				try {thread.sleep(500);} 
				catch (InterruptedException e) {System.out.println(e.getMessage());}
				driver.findElement(By.name("tempo")).sendKeys(((i+1)*10+""));
				try {thread.sleep(500);} 
				catch (InterruptedException e) {System.out.println(e.getMessage());}
				driver.findElement(By.name("descricao")).sendKeys("aaaaaaaaaaaaa");
				try {thread.sleep(500);} 
				catch (InterruptedException e) {System.out.println(e.getMessage());}
				driver.findElement(By.name("envio")).click();
			}
			driver.findElement(By.name("salvar")).click();
			try {thread.sleep(5000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/lista.jsp");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("ativar")).click();
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/lista2.jsp");
			try {thread.sleep(2000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("logout")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/principal.html");
			try {thread.sleep(2000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.close();
		}
	}
}