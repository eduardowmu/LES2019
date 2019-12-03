package br.edu.fatec2019.conducaoTests;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import com.sun.javafx.css.StyleCache.Key;

public class CompraTest 
{	public static void main(String[] args) throws InterruptedException
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		Thread thread = new Thread();
		if(driver != null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/login.jsp");
			driver.manage().window().maximize();
			thread.sleep(2000);
			driver.findElement(By.id("email")).sendKeys("alex@gmail.com");
			thread.sleep(1000);
			driver.findElement(By.id("senha")).sendKeys("!@#Abc123");
			thread.sleep(1000);
			driver.findElement(By.id("action")).click();
			thread.sleep(1000);
			driver.get("http://localhost:8080/ProjetoLES2019/meusCursos2.jsp");
			driver.findElement(By.linkText("| Comprar Cursos |")).click();
			thread.sleep(1000);
			driver.get("http://localhost:8080/ProjetoLES2019/cursos_compra.jsp");
			driver.findElement(By.id("2")).click();
			thread.sleep(2000);
			driver.getCurrentUrl();
			driver.findElement(By.name("action")).click();
			thread.sleep(2000);
			driver.getCurrentUrl();
			driver.findElement(By.linkText("Continuar Comprando")).click();
			thread.sleep(2000);
			driver.getCurrentUrl();
			driver.findElement(By.id("3")).click();
			thread.sleep(2000);
			driver.getCurrentUrl();
			driver.findElement(By.name("action")).click();
			thread.sleep(2000);
			driver.getCurrentUrl();
			thread.sleep(1000);
			driver.findElement(By.id("finalizar")).click();
			thread.sleep(2000);
			driver.getCurrentUrl();
			driver.findElement(By.linkText("adicionar novo cartão")).click();
			thread.sleep(2000);
			driver.getCurrentUrl();
			driver.findElement(By.name("numero")).sendKeys("1023504698075049");
			thread.sleep(1000);
			driver.findElement(By.name("code")).sendKeys("246");
			thread.sleep(1000);
			driver.findElement(By.name("vencimento")).sendKeys("14");
			thread.sleep(1000);
			driver.findElement(By.name("vencimento")).sendKeys("10");
			thread.sleep(1000);
			driver.findElement(By.name("vencimento")).sendKeys("2026");
			thread.sleep(1000);
			driver.findElement(By.name("titular")).sendKeys("Alex Silva");
			thread.sleep(1000);
			driver.findElement(By.id("salvar")).click();
			thread.sleep(2000);
			driver.getCurrentUrl();
			driver.findElement(By.id("id_valor_parcela")).clear();
			thread.sleep(1000);
			driver.findElement(By.id("id_valor_parcela")).sendKeys("20");
			thread.sleep(1000);
			driver.findElement(By.id("selCARD1")).click();
			thread.sleep(1000);
			driver.findElement(By.name("email")).sendKeys("alexsilva@gmail.com");
			thread.sleep(1000);
			driver.findElement(By.id("fechar")).click();
			thread.sleep(6000);
			driver.close();
		}
	}
}