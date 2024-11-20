package edu.sunmoon.kakao;

import edu.sunmoon.util.KakaoLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class KakaoTests1 {

    @Value("${kakao.api.rest-api-key}")
    String key;

    @Test
    void contextLoads() throws Exception {
        String lat = "36.801572";
        String lng = "127.074947";
        String type = "병원";
        String json = (String) KakaoLocalUtil.getContents(key, lat, lng, type);
        log.info(json);
    }

}
