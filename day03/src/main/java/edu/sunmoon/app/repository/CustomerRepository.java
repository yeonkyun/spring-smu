package edu.sunmoon.app.repository;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CustomerRepository extends SMRepository<String, CustomerDTO> {
    List<CustomerDTO> SelectByName(String name) throws Exception;
}