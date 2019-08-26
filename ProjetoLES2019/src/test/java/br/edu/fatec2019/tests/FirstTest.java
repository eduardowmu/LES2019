package br.edu.fatec2019.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class FirstTest 
{	public static void main(String[] args) 
	{	String path = "junit\\chromedriver.exe";
		System.setProperty("webdriver.chrome.driver", path);
		WebDriver driver = new ChromeDriver();
		
		if(driver!=null)
		{	driver.get("http://localhost:8080/ProjetoLES2019/principal.html");
			driver.manage().window().maximize();
			//fazer tour virtual
			driver.findElement(By.id("tour")).click();
			Thread thread = new Thread();
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/cursos.jsp");
			driver.findElement(By.id("cadastro")).click();
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/cadastroUsuarios.jsp");
			driver.findElement(By.name("nome")).sendKeys("Sergio");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("sobrenome")).sendKeys("Ferreira");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("cpf")).sendKeys("31348749032");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("ddd")).sendKeys("11");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("fone")).sendKeys("999669966");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("dtnasc")).sendKeys("15/11/1977");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("email")).sendKeys("spfs25@ig.com.br");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("cardName")).sendKeys("SERGIO FERREIRA");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("cardNumber")).sendKeys("1234567890123456");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("seg")).sendKeys("123");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("pass")).sendKeys("Abc123!@#");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("pass2")).sendKeys("Abc123!@#");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("action")).click();
			try {thread.sleep(3000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.get("http://localhost:8080/ProjetoLES2019/loginAluno.html");
			driver.findElement(By.name("email")).sendKeys("spfs25@ig.com.br");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("senha")).sendKeys("Abc123!@#");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("login")).sendKeys(Keys.ENTER);;
			driver.get("http://localhost:8080/ProjetoLES2019/inicialAluno.html");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("cursos")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/cursos_compra.jsp");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("angular_info")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/curso_informacao.jsp");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("comprar")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/pagamento.jsp");
			driver.findElement(By.name("numero")).sendKeys("1234567890123456");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("nome")).sendKeys("SERGIO FERREIRA");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("pagar")).click();
			try {thread.sleep(5000);} 
			catch (InterruptedException e) {}
			driver.get("http://localhost:8080/ProjetoLES2019/inicialAluno.html");
			driver.findElement(By.name("curso")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/ListaCursos.jsp");
			try {thread.sleep(1000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.findElement(By.name("angular")).click();
			driver.get("http://localhost:8080/ProjetoLES2019/curso_estrutura.jsp");
			try {thread.sleep(5000);} 
			catch (InterruptedException e) {}
			driver.findElement(By.name("logout")).click();
			try {thread.sleep(3000);} 
			catch (InterruptedException e) {System.out.println(e.getMessage());}
			driver.close();
		}
	}
}