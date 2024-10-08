package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/chart")
public class ChartController {
    String dir = "chart/";
    @RequestMapping("")
    public String chart(Model model) {
        log.info("chart page called");
        model.addAttribute("center", dir + "center");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/chart1")
    public String chart1(Model model) {
        log.info("chart1 page called");
        model.addAttribute("center", dir + "chart1");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/chart2")
    public String chart2(Model model) {
        log.info("chart2 page called");
        model.addAttribute("center", dir + "chart2");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/chart3")
    public String chart3(Model model) {
        log.info("chart3 page called");
        model.addAttribute("center", dir + "chart3");
        model.addAttribute("left", dir + "left");
        return "index";
    }
}
