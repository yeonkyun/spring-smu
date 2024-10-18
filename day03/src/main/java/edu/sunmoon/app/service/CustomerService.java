package edu.sunmoon.app.service;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.frame.SMService;
import edu.sunmoon.app.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomerService implements SMService<String, CustomerDTO> {
    final CustomerRepository customerRepository;

    @Override
    public void add(CustomerDTO customerDTO) throws Exception {
        customerRepository.insert(customerDTO);
    }

    @Override
    public void modify(CustomerDTO customerDTO) throws Exception {
        customerRepository.update(customerDTO);
    }

    @Override
    public void delete(String s) throws Exception {
        customerRepository.delete(s);
    }

    @Override
    public CustomerDTO get(String s) throws Exception {
        return customerRepository.selectOne(s);
    }

    @Override
    public List<CustomerDTO> get() throws Exception {
        return customerRepository.select();
    }

    public List<CustomerDTO> getByName(String name) throws Exception {
        return customerRepository.SelectByName(name);
    }
}
