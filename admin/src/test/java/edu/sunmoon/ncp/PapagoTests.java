package edu.sunmoon.ncp;


import edu.sunmoon.util.PapagoUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class PapagoTests {
    @Value("${app.key.papago-id}")
    String ClientId;

    @Value("${app.key.papago-secret}")
    String ClientSecret;

    @Test
    void contextLoads() {
        String msg = "안녕하세요";
        String result = PapagoUtil.getMsg(ClientId, ClientSecret, msg, "ko");
        log.info(result);
    }

}
