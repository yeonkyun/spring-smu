package edu.sunmoon.cart;

import edu.sunmoon.app.dto.CartDTO;
import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.service.CartService;
import edu.sunmoon.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UpdateTest {
    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        try {
//            cartService.modify(CartDTO.builder().cartId(1)
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
