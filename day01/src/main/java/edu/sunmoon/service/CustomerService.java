package edu.sunmoon.service;

import edu.sunmoon.dto.Customer;
import edu.sunmoon.frame.SMRepository;
import edu.sunmoon.frame.SMService;
import edu.sunmoon.repository.CustomerRepository;

public class CustomerService implements SMService<String, Customer> {
    SMRepository<String, Customer> repository;

    public CustomerService() {
        this.repository = new CustomerRepository();
    }

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
