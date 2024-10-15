package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

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

    @RequestMapping("/workshop")
    @ResponseBody
    public Map<String, Map<Integer, List<Integer>>> workshop() {
        Map<String, Map<Integer, List<Integer>>> salesData = new HashMap<>();
        String[] genders = {"남자", "여자"};
        Random random = new Random();

        for (String gender : genders) {
            Map<Integer, List<Integer>> yearData = new HashMap<>();
            for (int year = 2020; year <= 2024; year++) {
                List<Integer> monthlyData = new ArrayList<>();
                for (int month = 0; month < 12; month++) {
                    monthlyData.add(random.nextInt(4000) + 1000); // 1000 ~ 5000 사이의 랜덤 값
                }
                yearData.put(year, monthlyData);
            }
            salesData.put(gender, yearData);
        }
        return salesData;
    }
}
