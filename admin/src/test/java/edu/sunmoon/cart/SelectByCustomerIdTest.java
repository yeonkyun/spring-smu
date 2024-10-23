package edu.sunmoon.cart;

import edu.sunmoon.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SelectByCustomerIdTest {
    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        try {
            cartService.getByCustomerId("customer001");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
