package edu.sunmoon.app;

import edu.sunmoon.dto.Customer;
import edu.sunmoon.frame.SMService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Application {
    public static void main(String[] args) {
        ApplicationContext factory = new ClassPathXmlApplicationContext("spring.xml");
        SMService<String, Customer> service = (SMService<String, Customer>) factory.getBean("customerService");
        service.remove("id01");
    }
}
