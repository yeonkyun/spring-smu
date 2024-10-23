package edu.sunmoon.cart;

import edu.sunmoon.app.dto.CartDTO;
import edu.sunmoon.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SelectByItemName {
    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        try {
            CartDTO cart = CartDTO.builder()
                    .customerId("customer001")
                    .itemName("아메리카노")
                    .build();
            cartService.getByItemName(cart);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
