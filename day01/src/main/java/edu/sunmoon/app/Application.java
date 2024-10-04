package edu.sunmoon.app;

import edu.sunmoon.dto.Customer;
import edu.sunmoon.frame.SMService;
import edu.sunmoon.service.CustomerService;

public class Application {
    public static void main(String[] args) {
        SMService<String, Customer> service = new CustomerService();
        service.remove("id01");
    }
}
