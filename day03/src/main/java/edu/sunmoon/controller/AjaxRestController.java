package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/getctime")
    public Object getctime() {
        JSONObject obj = new JSONObject();
        // {"currentTime":"2021-07-07 10:00:00"}
        LocalDateTime currentTime = LocalDateTime.now();
        obj.put("currentTime", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(currentTime));
        return obj;
    }
}
