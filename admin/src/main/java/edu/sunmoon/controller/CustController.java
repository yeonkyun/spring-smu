package edu.sunmoon.controller;

import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.service.CustService;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
public class CustController {

    final CustService custService;

    String dir = "cust/";
    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        // Database에서 데이터를 가지고 온다.
        List<CustomerDTO> list = new ArrayList<>();
        try {
            list = custService.get();
            model.addAttribute("custs",list);
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            throw new Exception("ER0001");
        }
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model){

        model.addAttribute("center",dir+"add");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model,@RequestParam("id") String id){
        // Database에서 데이터를 가지고 온다.
        CustomerDTO customerDTO = null;
        try {
            customerDTO = custService.get(id);
            model.addAttribute("cust", customerDTO);
            model.addAttribute("center",dir+"detail");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/update")
    public String update(Model model,CustomerDTO customerDTO){

        try {
            custService.modify(customerDTO);
            return "redirect:/cust/detail?id="+customerDTO.getCustomerId();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model,CustomerDTO customerDTO) throws Exception {
        custService.add(customerDTO);
        return "redirect:/cust/detail?id="+customerDTO.getCustomerId();

    }
    @RequestMapping("/delete")
    public String delete(Model model,@RequestParam("id") String id){

        try {
            custService.delete(id);
            return "redirect:/cust/get";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
