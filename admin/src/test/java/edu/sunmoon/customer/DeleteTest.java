package edu.sunmoon.customer;

import edu.sunmoon.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class DeleteTest {
    @Autowired
    CustService custService;

    @Test
    void contextLoads() {
        try {
            custService.delete("id11");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
