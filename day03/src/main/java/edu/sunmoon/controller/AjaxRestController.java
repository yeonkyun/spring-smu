package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/getctime")
    public Object getctime() {
        JSONObject obj = new JSONObject();
        LocalDateTime currentTime = LocalDateTime.now();
        obj.put("currentTime", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(currentTime));
        return obj;
    }

    @RequestMapping("/getrank")
    public Object getrank() {
        JSONArray jsonArray = new JSONArray();
        String[] keywords = {"아이폰", "아이패드", "맥북", "애플워치", "에어팟", "아이맥", "맥미니", "애플펜슬", "애플TV", "홈팟"};
        int[] counts = new int[keywords.length];
        for (int i = 0; i < counts.length; i++) {
            counts[i] = (int) (Math.random() * 100);
        }
        for (int i = 0; i < counts.length; i++) {
            for (int j = i + 1; j < counts.length; j++) {
                if (counts[i] < counts[j]) {
                    int temp = counts[i];
                    counts[i] = counts[j];
                    counts[j] = temp;
                    String tempStr = keywords[i];
                    keywords[i] = keywords[j];
                    keywords[j] = tempStr;
                }
            }
        }
        for (int i = 0; i < counts.length; i++) {
            JSONObject obj = new JSONObject();
            obj.put("rank", i + 1);
            obj.put("keyword", keywords[i]);
            jsonArray.add(obj);
        }
        log.info("서버에서 반환하는 데이터: {}", jsonArray.toJSONString()); // Log the data
        return jsonArray;
    }
}