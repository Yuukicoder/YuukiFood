/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */

import org.junit.Test;
import static org.junit.Assert.*;
import org.openqa.selenium.chrome.ChromeDriver;

/**
 *
 * @author Admin
 */
public class TestSelenium {
        private String driverURL = "C:\\Users\\Admin\\Downloads\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe";
        public TestSelenium(){
        }

    public ChromeDriver getDriver() {
          System.setProperty("webdriver.chrome.driver", driverURL);
        return new ChromeDriver();
    }
    
}
