package edu.sunmoon.ncp;

import edu.sunmoon.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Map;

@SpringBootTest
@Slf4j
class OcrTests {

    @Value("${app.dir.uploadimgdir}")
    String dir;

    @Value("${naver.api.ocr.gateway-url}")
    String OCRGatewayUrl;

    @Value("${naver.api.ocr.secret-key}")
    String OCRSecretKey;

    @Test
    void contextLoads() {
        String imgname = "no.jpeg";
        JSONObject jsonObject = (JSONObject) OCRUtil.getResult(dir, imgname, OCRGatewayUrl, OCRSecretKey);
        log.info(jsonObject.toJSONString());
        Map<String, String> map = OCRUtil.getData(jsonObject);
        map.values().forEach(txt -> {
            log.info(txt);
        });

    }

}
