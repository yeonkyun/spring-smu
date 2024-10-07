package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class NextController {
    @RequestMapping("/next")
    public String next() {
        log.info("next() 호출됨");
        return "next";
    }
}
