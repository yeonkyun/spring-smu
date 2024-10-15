package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {
    @RequestMapping("/")
    public String main(Model model) {
        log.info("index page called");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        log.info("login page called");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        log.info("register page called");
        return "index";
    }

    @Value("${kakao.api.key}")
    private String kakaoApiKey;

    @RequestMapping("/about")
    public String about(Model model) {
        model.addAttribute("kakaoApiKey", kakaoApiKey);
        model.addAttribute("center", "about");
        log.info("about page called");
        return "index";
    }
}
