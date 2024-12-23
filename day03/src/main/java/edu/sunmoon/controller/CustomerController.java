package edu.sunmoon.controller;

import com.github.pagehelper.PageInfo;
import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.dto.Search;
import edu.sunmoon.app.service.CustomerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/customer")
public class CustomerController {
    final CustomerService customerService;
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

//    @RequestMapping("/get")
//    public String get(Model model) {
//        List<CustomerDTO> customersDTO = null;
//        try {
//            customersDTO = customerService.get();
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//
//        log.info("customer get page called");
//        model.addAttribute("customers", customersDTO);
//        model.addAttribute("left", dir + "left");
//        model.addAttribute("center", dir + "get");
//        return "index";
//    }

    @RequestMapping("/get")
    public String page(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model) {
        log.info("customer page page called");
        PageInfo<CustomerDTO> pageInfo = null;
        try {
            pageInfo = new PageInfo<>(customerService.getPage(pageNo), 5);  // 5: 페이지 번호 갯수
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("target", "/customer");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "page");
        return "index";
    }

    @RequestMapping("/search")
    public String search(Model model) {
        log.info("customer search page called");


        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "search");
        return "index";
    }

    @RequestMapping("/searchimpl")
    public String searchimpl(Model model, Search search, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
        log.info("customer searchimpl page called");
        PageInfo<CustomerDTO> pageInfo = null;
        try {
            pageInfo = new PageInfo<>(customerService.getfindpage(search, pageNo), pageNo);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("target", "customer");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "search");
        return "index";
    }


    @RequestMapping("/detail")
    public String add(Model model, @RequestParam("id") String id) {
        CustomerDTO customerDTO = null;
        log.info("customer detail page called");
        try {
            customerDTO = customerService.get(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("customer", customerDTO);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, CustomerDTO customerDTO) {
        try {
            log.info("customer update page called");
            customerService.modify(customerDTO);
            return "redirect:/customer/detail?id=" + customerDTO.getCustomerId();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, @RequestParam("id") String id) {
        log.info("customer delete page called");
        try {
            customerService.delete(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/customer/get";
    }
}
