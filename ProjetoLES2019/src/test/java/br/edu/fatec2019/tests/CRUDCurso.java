package br.edu.fatec2019.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class CRUDCurso 
{	public static void main(String[] args) throws InterruptedException 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		Thread thread = new Thread();
		if(driver != null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/login.jsp");
	    	driver.manage().window().maximize();
	    	thread.sleep(1000);
	    	driver.findElement(By.name("email")).sendKeys("eduardo@gmail.com");
			thread.sleep(1000);
			driver.findElement(By.name("senha")).sendKeys("!@#Abc123");
			thread.sleep(1000);
			driver.get("http://localhost:8080/ProjetoLES2019/inicialAdm.jsp");
			thread.sleep(1000);
			driver.get("http://localhost:8080/ProjetoLES2019/ListaCursos.jsp");
			thread.sleep(1000);
			driver.findElement(By.linkText("Novo Curso")).click();
			thread.sleep(1000);
			driver.get("http://localhost:8080/ProjetoLES2019/cadastroCursos.jsp");
	    	driver.findElement(By.name("instrutor")).sendKeys("xxxxyyyy");
	    	thread.sleep(1000);
			driver.findElement(By.name("titulo")).sendKeys("cccddd");
			thread.sleep(1000);
			driver.findElement(By.name("descricao")).sendKeys("eeefff");
			thread.sleep(1000);
			driver.findElement(By.name("valor")).sendKeys("20");
			thread.sleep(1000);
			driver.findElement(By.name("action")).click();
			thread.sleep(3000);
			driver.get("http://localhost:8080/ProjetoLES2019/ListaCursos.jsp");
			thread.sleep(1000);
			driver.findElement(By.name("id")).sendKeys("2");
			thread.sleep(1000);
			driver.findElement(By.id("search")).click();
			thread.sleep(1000);
			driver.findElement(By.name("nome")).sendKeys("cccddd");
			thread.sleep(1000);
			driver.findElement(By.id("search")).click();
			thread.sleep(1000);
			driver.findElement(By.name("instrutor")).sendKeys("xxxxyyyy");
			thread.sleep(1000);
			driver.findElement(By.id("search")).click();
			thread.sleep(1000);
			driver.findElement(By.name("nome")).sendKeys("cccddd");
			thread.sleep(1000);
			driver.findElement(By.name("instrutor")).sendKeys("xxxxyyyy");
			thread.sleep(1000);
			driver.findElement(By.id("search")).click();
			thread.sleep(1000);
			driver.findElement(By.id("update")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/alteraCursos.jsp");
			driver.findElement(By.name("valor")).click();
			driver.findElement(By.name("valor")).clear();
			thread.sleep(1000);
			//trocar este valor!
			driver.findElement(By.name("valor")).sendKeys("25");
			thread.sleep(1000);
			driver.findElement(By.name("action")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/ListaCursos.jsp");
			thread.sleep(1000);
			//mudar o valor para o último da tabela do BD
			driver.findElement(By.name("instrutor")).sendKeys("xxxxyyyy");
			thread.sleep(1000);
			driver.findElement(By.id("search")).click();
			thread.sleep(2000);
			driver.findElement(By.id("delete")).click();
			thread.sleep(1000);
			driver.switchTo().alert().accept();
		}
	}
}