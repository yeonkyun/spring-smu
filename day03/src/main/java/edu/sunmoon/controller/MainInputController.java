package edu.sunmoon.controller;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class MainInputController {
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, @RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session) {
        log.info("id: {}, pw: {}", id, pw);
        model.addAttribute("id", id);
        model.addAttribute("pw", pw);

        if(id.equals("aaa") && pw.equals("111")){
            session.setAttribute("loginid", id);
            model.addAttribute("center","loginok");
        }else{
            model.addAttribute("center","loginfail");
        }
        return "redirect:/";
    }

    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }
}
