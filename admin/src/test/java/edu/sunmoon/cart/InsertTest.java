package edu.sunmoon.cart;

import edu.sunmoon.app.dto.CartDTO;
import edu.sunmoon.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class InsertTest {
    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        try {
            CartDTO cart = CartDTO.builder()
                    .customerId("id01")
                    .itemId(1)
                    .quantity(2)
                    .build();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
