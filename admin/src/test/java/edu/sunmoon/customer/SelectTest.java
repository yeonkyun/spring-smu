package edu.sunmoon.customer;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class SelectTest {
    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        try {
            List<CustomerDTO> list = custService.get();
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
