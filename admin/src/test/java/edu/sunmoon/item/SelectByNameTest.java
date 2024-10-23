package edu.sunmoon.item;

import edu.sunmoon.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SelectByNameTest {
    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        try {
            itemService.getByName("아이스");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
