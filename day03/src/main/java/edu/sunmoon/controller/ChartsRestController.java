package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
@Slf4j
@RequestMapping("/charts")
public class ChartsRestController {
    @RequestMapping("/chart1")
    public Object chart1() {
        JSONArray jsonArray = new JSONArray();
        for (int i = 1; i <= 5; i++) {
            Random random = new Random();
            JSONArray jsonArray1 = new JSONArray();
            JSONObject jsonObject = new JSONObject();

            jsonObject.put("name", "NAME");
            for (int j = 1; j <= 12; j++) {
                jsonArray1.add(random.nextInt(40) + 1);
            }

            jsonObject.put("data", jsonArray1);
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
}
