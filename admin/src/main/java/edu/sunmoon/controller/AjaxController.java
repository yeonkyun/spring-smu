package edu.sunmoon.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/ajax")
public class AjaxController {
    String dir = "ajax/";
    @RequestMapping("")
    public String ajax(Model model) {
        log.info("ajax() called");
        model.addAttribute("center", dir + "center");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/ajax1")
    public String ajax1(Model model) {
        log.info("ajax1() called");
        model.addAttribute("center", dir + "ajax1");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/ajax2")
    public String ajax2(Model model) {
        log.info("ajax2() called");
        model.addAttribute("center", dir + "ajax2");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/ajax3")
    public String ajax3(Model model) {
        log.info("ajax3() called");
        model.addAttribute("center", dir + "ajax3");
        model.addAttribute("left", dir + "left");
        return "index";
    }

    @RequestMapping("/workshop")
    public String workshop(Model model) {
        log.info("AJAX workshop() called");
        model.addAttribute("center", dir + "workshop");
        model.addAttribute("left", dir + "left");
        return "index";
    }
}
