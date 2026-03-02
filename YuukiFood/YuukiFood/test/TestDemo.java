/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import org.junit.Test;
import static org.junit.Assert.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

/**
 *
 * @author Admin
 */
public class TestDemo extends TestSelenium{
        ChromeDriver driver = getDriver();
        @Test
public void login_title_test(){
        driver.get("https://the-internet.herokuapp.com/login");
           WebElement username = driver.findElement(By.name("username"));
        WebElement password = driver.findElement(By.name("password"));
        username.sendKeys("tomsmith");
        password.sendKeys("SuperSecretPassword!");
        // Click login button
        driver.findElement(By.id("login")).click();

        // Check if login successfully, if not the title will not be same as expected
        String title = driver.getTitle();

//        driver.close();
        assertEquals( title, "The Internet");
    
    }
    
    
}
