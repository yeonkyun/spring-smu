package edu.sunmoon.app.repository;

import com.github.pagehelper.Page;
import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.dto.Search;
import edu.sunmoon.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CustRepository extends SMRepository<String, CustomerDTO> {
    List<CustomerDTO> SelectByName(String name) throws Exception;
    Page<CustomerDTO> getpage() throws Exception;
    Page<CustomerDTO> getfindpage(Search search) throws Exception;
}
