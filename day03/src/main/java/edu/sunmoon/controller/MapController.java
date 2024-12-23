package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequestMapping("/map")
public class MapController {
    String dir = "map/";

    @Value("${kakao.api.key}")
    private String kakaoApiKey;

    @RequestMapping("")
    public String map(Model model) {
        log.info("map page called");
        model.addAttribute("center", dir + "center");
        model.addAttribute("left", dir + "left");
        model.addAttribute("kakaoApiKey", kakaoApiKey);
        return "index";
    }

    @RequestMapping("/map1")
    public String map1(Model model) {
        log.info("map1 page called");
        model.addAttribute("center", dir + "map1");
        model.addAttribute("left", dir + "left");
        model.addAttribute("kakaoApiKey", kakaoApiKey);
        return "index";
    }

    @RequestMapping("/map2")
    public String map2(Model model) {
        log.info("map2 page called");
        model.addAttribute("center", dir + "map2");
        model.addAttribute("left", dir + "left");
        model.addAttribute("kakaoApiKey", kakaoApiKey);
        return "index";
    }

    @RequestMapping("/map3")
    public String map3(Model model) {
        log.info("map3 page called");
        model.addAttribute("center", dir + "map3");
        model.addAttribute("left", dir + "left");
        model.addAttribute("kakaoApiKey", kakaoApiKey);
        return "index";
    }

    @RequestMapping("/go")
    public String go(Model model, @RequestParam("target") int target) {
        log.info("go page called");
        model.addAttribute("target", target);
        model.addAttribute("center", dir + "go");
        model.addAttribute("left", dir + "left");
        model.addAttribute("kakaoApiKey", kakaoApiKey);
        return "index";
    }
}
