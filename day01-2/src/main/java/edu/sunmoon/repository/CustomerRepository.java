package edu.sunmoon.repository;

import edu.sunmoon.dto.Customer;
import edu.sunmoon.frame.SMRepository;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerRepository implements SMRepository<String, Customer> {
    @Override
    public void insert(Customer customer) {
        System.out.println("CustomerRepository.insert(): " + customer);
    }

    @Override
    public void update(Customer customer) {
        System.out.println("CustomerRepository.update(): " + customer);
    }

    @Override
    public void delete(String s) {
        System.out.println("CustomerRepository.delete(): " + s);
    }
}
