package edu.sunmoon.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.dto.Search;
import edu.sunmoon.app.frame.SMService;
import edu.sunmoon.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustService implements SMService<String, CustomerDTO> {
    final CustRepository customerRepository;

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

    public Page<CustomerDTO> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return customerRepository.getpage();
    }

    public Page<CustomerDTO> getfindpage(Search search, int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return customerRepository.getfindpage(search);
    }
}
