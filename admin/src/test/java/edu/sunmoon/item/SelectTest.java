package edu.sunmoon.item;

import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class SelectTest {
    @Autowired
    ItemService itemService;

    @Test
    void contextLoads() {
        try {
            List<ItemDTO> list = itemService.get();
            for (ItemDTO item : list) {
                log.info(item.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    @Autowired
//    private JdbcTemplate jdbcTemplate;
//
//    @Test
//    public void testConnection() {
//        jdbcTemplate.execute("SELECT 1");
//    }


}
