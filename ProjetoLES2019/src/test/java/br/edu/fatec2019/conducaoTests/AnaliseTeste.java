package br.edu.fatec2019.conducaoTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
public class AnaliseTeste 
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
			driver.findElement(By.name("action")).click();
			thread.sleep(1000);
			driver.get("http://localhost:8080/ProjetoLES2019/inicialAdm.jsp");
			driver.findElement(By.linkText("| Gerar Relatórios |")).click();
			thread.sleep(1000);
			driver.get("http://localhost:8080/ProjetoLES2019/gerarRelatorios.jsp");
			thread.sleep(1000);
			driver.findElement(By.name("txtDataInicio")).sendKeys("10");
			thread.sleep(1000);
			driver.findElement(By.name("txtDataInicio")).sendKeys("01");
			thread.sleep(1000);
			driver.findElement(By.name("txtDataInicio")).sendKeys("2019");
			thread.sleep(1000);
			driver.findElement(By.name("txtDataFim")).sendKeys("11");
			thread.sleep(1000);
			driver.findElement(By.name("txtDataFim")).sendKeys("30");
			thread.sleep(1000);
			driver.findElement(By.name("txtDataFim")).sendKeys("2019");
			thread.sleep(1000);
			driver.findElement(By.id("action")).click();
		}
	}
}
