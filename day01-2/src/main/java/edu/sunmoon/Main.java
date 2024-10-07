package edu.sunmoon;

import edu.sunmoon.dto.Customer;
import edu.sunmoon.frame.SMService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
    public static void main(String[] args) {
        ApplicationContext factory = new ClassPathXmlApplicationContext("spring.xml");
        SMService<String, Customer> service = (SMService<String, Customer>) factory.getBean("customerservice");
        service.remove("id01");
    }
}