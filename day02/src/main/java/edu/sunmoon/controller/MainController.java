package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {
    @RequestMapping("/")
    public String main(Model model) {
        log.info("main() 호출됨");
        model.addAttribute("message", "Hello, Spring Boot!");
        model.addAttribute("number", 100);
        return "index";
    }

    @RequestMapping("/mypage")
    public String mypage() {
        log.info("mypage() 호출됨");
        return "mypage";
    }
}
