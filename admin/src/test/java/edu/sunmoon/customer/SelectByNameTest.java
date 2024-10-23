package edu.sunmoon.customer;

import edu.sunmoon.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SelectByNameTest {
    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        try {
            log.info(custService.getByName("길").toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
