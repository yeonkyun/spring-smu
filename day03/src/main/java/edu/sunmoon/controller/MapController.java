package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/map")
public class MapController {
    String dir = "map/";
    @RequestMapping("")
    public String map(Model model) {
        log.info("map page called");
        model.addAttribute("center", dir + "center");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/map1")
    public String map1(Model model) {
        log.info("map1 page called");
        model.addAttribute("center", dir + "map1");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/map2")
    public String map2(Model model) {
        log.info("map2 page called");
        model.addAttribute("center", dir + "map2");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/map3")
    public String map3(Model model) {
        log.info("map3 page called");
        model.addAttribute("center", dir + "map3");
        model.addAttribute("left", dir + "left");
        return "index";
    }
}
