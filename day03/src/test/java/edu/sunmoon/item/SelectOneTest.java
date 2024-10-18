package edu.sunmoon.item;

import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SelectOneTest {
    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        try {
            ItemDTO item = itemService.get(13);
            log.info(item.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
