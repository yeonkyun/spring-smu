package edu.sunmoon.repository;

import edu.sunmoon.dto.Customer;
import edu.sunmoon.frame.SMRepository;

public class CustomerOracleRepository implements SMRepository<String, Customer> {
    @Override
    public void insert(Customer customer) {
        System.out.println("CustomerOracleRepository.insert(): " + customer);
    }

    @Override
    public void update(Customer customer) {
        System.out.println("CustomerOracleRepository.update(): " + customer);
    }

    @Override
    public void delete(String s) {
        System.out.println("CustomerOracleRepository.delete(): " + s);
    }
}
