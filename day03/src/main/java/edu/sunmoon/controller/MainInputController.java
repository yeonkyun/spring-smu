package edu.sunmoon.controller;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainInputController {
    final CustomerService customerService;
    final BCryptPasswordEncoder encoder;

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, @RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession session) {
        log.info("id: {}, pw: {}", id, pw);
        model.addAttribute("id", id);
        model.addAttribute("pw", pw);

        CustomerDTO customerDTO = null;
        try {
            customerDTO = customerService.get(id);

            if (encoder.matches(pw, customerDTO.getCustomerPw())) {
                session.setAttribute("loginid", customerDTO);
                model.addAttribute("center", "loginok");
                return "redirect:/";
            } else {
                model.addAttribute("center", "loginfail");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/";
    }

    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/registerimpl")
    public String loginimpl(Model model, CustomerDTO customerDTO, HttpSession session) throws DuplicateKeyException, Exception {
        log.info("Customer Info: " + customerDTO.toString());
        try {
            customerDTO.setCustomerPw(encoder.encode(customerDTO.getCustomerPw()));
            customerService.add(customerDTO);
        } catch (DuplicateKeyException e) {
            throw e;
        } catch (Exception e) {
            throw e;
        }
        session.setAttribute("loginid", customerDTO);
        model.addAttribute("center", "registerok");
        return "redirect:/";
    }
}
