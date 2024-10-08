package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/javascript")
public class JavascriptController {
    String dir = "javascript/";
    @RequestMapping("")
    public String javascript(Model model) {
        log.info("javascript page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/javascript1")
    public String javascript1(Model model) {
        log.info("javascript1 page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "javascript1");
        return "index";
    }

    @RequestMapping("/javascript2")
    public String javascript2(Model model) {
        log.info("javascript2 page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "javascript2");
        return "index";
    }

    @RequestMapping("/javascript3")
    public String javascript3(Model model) {
        log.info("javascript3 page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "javascript3");
        return "index";
    }
}
