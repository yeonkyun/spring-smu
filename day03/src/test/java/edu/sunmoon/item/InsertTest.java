package edu.sunmoon.item;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.service.CustomerService;
import edu.sunmoon.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class InsertTest {
    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        try {
            itemService.add(ItemDTO.builder().itemName("딸기스무디").itemPrice(5000).imgName("strawberry_smoothie.jpg").build());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
