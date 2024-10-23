package edu.sunmoon.customer;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.service.CustomerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class SelectTest {
    @Autowired
    CustomerService customerService;

    @Test
    void contextLoads() {
        try {
            List<CustomerDTO> list = customerService.get();
            for (CustomerDTO customerDTO : list) {
                log.info(customerDTO.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    @Autowired
//    private JdbcTemplate jdbcTemplate;
//
//    @Test
//    public void testConnection() {
//        jdbcTemplate.execute("SELECT 1");
//    }


}
