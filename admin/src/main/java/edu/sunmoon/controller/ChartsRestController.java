package edu.sunmoon.controller;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

@RestController
@Slf4j
@RequestMapping("/charts")
public class ChartsRestController {
    @Value("${app.dir.readlogdir}")
    private String readLogDir;

    @RequestMapping("/chart1")
    public Object chart1() throws Exception {
        String logfile = readLogDir + "power.log";

        JSONObject result = new JSONObject();

        //[{}]
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("name", "Power");

        CSVReader reader = null;
        reader = new CSVReader(new FileReader(logfile));

        String [] lineData = null;
        JSONArray jsonArray1 = new JSONArray();
        JSONArray timeArray = new JSONArray();
        String endline = "";
        String endTime = "";
        while((lineData = reader.readNext()) != null){
            jsonArray1.add(Float.parseFloat(lineData[1]));
            timeArray.add(lineData[0]);
            endTime = lineData[0];
            endline = lineData[1];
        }

        jsonObject.put("data", jsonArray1);

        jsonArray.add(jsonObject);

        // [{}]
        // {'x':[], result:[{}]}
        result.put("result", jsonArray);
        result.put("x",timeArray );
        result.put("endtime",endTime );
        result.put("endline",Float.parseFloat(endline) );
        return result;
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

    @RequestMapping("/chart2")
    public Object chart2() {
        // 파일 경로
        String path = readLogDir + "power.log";

        // 시간과 전력량 데이터를 받을 리스트
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        JSONObject result = new JSONObject();

        jsonObject.put("name", "전력량");

        try (CSVReader reader = new CSVReader(new FileReader(path))) {
            String[] nextLine;
            JSONArray jsonArray1 = new JSONArray();
            JSONArray timeArray = new JSONArray();

            while ((nextLine = reader.readNext()) != null) {
                timeArray.add(nextLine[0]);
                jsonArray1.add(nextLine[1]);
            }

            jsonObject.put("data", jsonArray1);
            jsonArray.add(jsonObject);

            result.put("time", timeArray);
            result.put("data", jsonArray);
        } catch (FileNotFoundException e) {
            log.error("파일을 찾을 수 없습니다.", e);
        } catch (IOException | CsvValidationException e) {
            log.error("파일을 읽는 중 오류가 발생했습니다.", e);
        }
        return result;
    }
}
