package edu.sunmoon.customer;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UpdateTest {
    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        try {
            custService.modify(CustomerDTO.builder().customerId("id11").customerPw("pwd11").customerName("수정된 테스터").build());
            log.info(custService.get("id11").toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
