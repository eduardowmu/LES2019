package br.edu.fatec2019.conducaoTests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

public class CompraComCupom 
{	public static void main(String[] args) throws InterruptedException 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		Thread thread = new Thread();
		if(driver != null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/login.jsp");
			driver.manage().window().maximize();
			thread.sleep(2000);
			
			driver.findElement(By.id("email")).sendKeys("eeefff@gmail.com");
			thread.sleep(1000);
			
			driver.findElement(By.id("senha")).sendKeys("@#$Abc123");
			thread.sleep(1000);
			
			driver.findElement(By.id("action")).click();
			thread.sleep(1000);
			
			driver.get("http://localhost:8080/ProjetoLES2019/meusCursos2.jsp");
			thread.sleep(1000);
			
			driver.findElement(By.linkText("| Comprar Cursos |")).click();
			thread.sleep(1000);
			
			driver.get("http://localhost:8080/ProjetoLES2019/cursos_compra.jsp");
			thread.sleep(2000);
			
			driver.findElement(By.id("5")).click();
			thread.sleep(2000);
			
			driver.getCurrentUrl();
			driver.findElement(By.name("action")).click();
			thread.sleep(2000);
			
			driver.getCurrentUrl();
			driver.findElement(By.linkText("Continuar Comprando")).click();
			thread.sleep(2000);
			
			driver.getCurrentUrl();
			driver.findElement(By.id("7")).click();
			thread.sleep(2000);
			
			driver.getCurrentUrl();
			driver.findElement(By.name("action")).click();
			thread.sleep(2000);
			
			new Select(driver.findElement(By.id("cupom"))).selectByIndex(1);
			thread.sleep(1000);
			
			driver.findElement(By.id("addCupom")).click();
			thread.sleep(1000);
			
			driver.findElement(By.id("finalizar")).click();
			thread.sleep(2000);
			
			driver.getCurrentUrl();
			driver.findElement(By.linkText("adicionar novo cartão")).click();
			thread.sleep(2000);
			
			driver.getCurrentUrl();
			driver.findElement(By.name("numero")).sendKeys("1236547899874561");
			thread.sleep(1000);
			
			driver.findElement(By.name("code")).sendKeys("963");
			thread.sleep(1000);
			
			driver.findElement(By.name("vencimento")).sendKeys("14");
			thread.sleep(1000);
			
			driver.findElement(By.name("vencimento")).sendKeys("10");
			thread.sleep(1000);
			
			driver.findElement(By.name("vencimento")).sendKeys("2026");
			thread.sleep(1000);
			
			driver.findElement(By.name("titular")).sendKeys("eee fff");
			thread.sleep(1000);
			
			driver.findElement(By.id("salvar")).click();
			thread.sleep(2000);
			
			driver.getCurrentUrl();
			driver.findElement(By.id("id_valor_parcela")).clear();
			thread.sleep(1000);
			
			driver.findElement(By.id("id_valor_parcela")).sendKeys("25");
			thread.sleep(1000);
			
			driver.findElement(By.id("selCARD")).click();
			thread.sleep(1000);
			
			driver.findElement(By.name("email")).sendKeys("ef@gmail.com");
			thread.sleep(1000);
			
			driver.findElement(By.id("fechar")).click();
		}
	}
}