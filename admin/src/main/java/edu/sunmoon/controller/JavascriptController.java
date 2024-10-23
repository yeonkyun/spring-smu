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

    @RequestMapping("/javascript4")
    public String javascript4(Model model) {
        log.info("javascript4 page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "javascript4");
        return "index";
    }

    @RequestMapping("/javascript5")
    public String javascript5(Model model) {
        log.info("javascript5 page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "javascript5");
        return "index";
    }

    @RequestMapping("/javascript6")
    public String javascript6(Model model) {
        log.info("javascript6 page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "javascript6");
        return "index";
    }
}
