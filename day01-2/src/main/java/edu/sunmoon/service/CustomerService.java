package edu.sunmoon.service;

import edu.sunmoon.dto.Customer;
import edu.sunmoon.frame.SMRepository;
import edu.sunmoon.frame.SMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("customerservice")
public class CustomerService implements SMService<String, Customer> {
    @Autowired
    SMRepository<String, Customer> repository;

    public void setRepository(SMRepository<String, Customer> repository) {
        this.repository = repository;
        System.out.println("ConnectionPool: Create()");
    }

//    public CustomerService() {
//        this.repository = new CustomerRepository();
//    }
//
//    public CustomerService(SMRepository<String, Customer> repository) {
//        this.repository = repository;
//    }

    @Override
    public void register(Customer customer) {
        repository.insert(customer);
    }

    @Override
    public void modify(Customer customer) {
        repository.update(customer);
    }

    @Override
    public void remove(String s) {
        repository.delete(s);
    }
}
