package edu.sunmoon.controller;

import edu.sunmoon.app.dto.CustomerDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/customer")
public class CustomerController {
    String dir = "customer/";

    @RequestMapping("")
    public String customer(Model model) {
        log.info("customer page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        log.info("customer add page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) {
        List<CustomerDTO> customersDTO = new ArrayList<>();
        customersDTO.add(CustomerDTO.builder().id("id01").pw("pw01").name("홍길동").build());
        customersDTO.add(CustomerDTO.builder().id("id02").pw("pw02").name("김철수").build());
        customersDTO.add(CustomerDTO.builder().id("id03").pw("pw03").name("이영희").build());
        customersDTO.add(CustomerDTO.builder().id("id04").pw("pw04").name("박영수").build());
        customersDTO.add(CustomerDTO.builder().id("id05").pw("pw05").name("최영자").build());
        model.addAttribute("customers", customersDTO);

        log.info("customer get page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");
        return "index";
    }
}
