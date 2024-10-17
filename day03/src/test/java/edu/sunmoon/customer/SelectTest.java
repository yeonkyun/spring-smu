package edu.sunmoon.customer;

import edu.sunmoon.app.service.CustomerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectTest {
    @Autowired
    CustomerService customerService;

    @Test
    void contextLoads() {
        try {
            customerService.get().forEach(customerDTO -> log.info(customerDTO.toString()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
