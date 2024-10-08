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
        log.info("main() called");
        return "index";
    }

    @RequestMapping("/404")
    public String error404(Model model) {
        log.info("error404() called");
        return "404";
    }

    @RequestMapping("/500")
    public String error500(Model model) {
        log.info("error500() called");
        return "500";
    }
}
