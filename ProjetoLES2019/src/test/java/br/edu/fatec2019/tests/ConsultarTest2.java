package br.edu.fatec2019.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class ConsultarTest2 
{	public static void main(String[] args) 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		Thread thread = new Thread();
		if(driver!=null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/gerenciarClientes.jsp");
		    //driver.manage().window().setSize(new Dimension(1382, 744));
		    driver.findElement(By.id("id")).click();
		    driver.findElement(By.id("id")).sendKeys("28");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("action")).click();
		    driver.findElement(By.id("name")).click();
		    driver.findElement(By.id("name")).sendKeys("ooo");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("action")).click();
		    driver.findElement(By.id("surname")).click();
		    driver.findElement(By.id("surname")).sendKeys("zzz");
		    driver.findElement(By.id("action")).click();
		    driver.findElement(By.id("id")).click();
		    driver.findElement(By.id("id")).sendKeys("26");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("name")).click();
		    driver.findElement(By.id("name")).sendKeys("ttt");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("surname")).click();
		    driver.findElement(By.id("surname")).sendKeys("bbb");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("action")).click();
		    driver.findElement(By.id("id")).click();
		    driver.findElement(By.id("id")).sendKeys("24");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("name")).click();
		    driver.findElement(By.id("name")).sendKeys("rr");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("surname")).click();
		    driver.findElement(By.id("surname")).sendKeys("tt");
		    try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.id("action")).click();
			try {thread.sleep(4000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.close();
		}
	}
}
