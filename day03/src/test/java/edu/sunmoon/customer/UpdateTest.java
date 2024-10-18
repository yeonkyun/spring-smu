package edu.sunmoon.customer;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.service.CustomerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UpdateTest {
    @Autowired
    CustomerService customerService;

    @Test
    void contextLoads() {
        try {
            customerService.modify(CustomerDTO.builder().id("id11").pw("pwd11").name("수정된 테스터").build());
            log.info(customerService.get("id11").toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
