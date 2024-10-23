package edu.sunmoon.item;

import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UpdateTest {
    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        try {
            itemService.modify(ItemDTO.builder().itemId(13).itemName("수정된 딸기 스무디").imgName("strawberry_smoothie.jpg").itemPrice(6000).build());
            itemService.get(13);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
