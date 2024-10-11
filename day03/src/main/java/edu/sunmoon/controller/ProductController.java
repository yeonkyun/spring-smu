package edu.sunmoon.controller;

import edu.sunmoon.dto.Product;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
    String dir = "product/";

    @RequestMapping("")
    public String product(Model model) {
        log.info("product page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        log.info("product add page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) {
        List<Product> products = new ArrayList<>();
        products.add(Product.builder().id(1000001).name("ASUS ROG CROSSHAIR X870E HERO").price(1099000).regDate(new Date()).build());
        products.add(Product.builder().id(1000002).name("AMD 라이젠9-6세대 9950X (그래니트 릿지) (정품)").price(1150000).regDate(new Date()).build());
        products.add(Product.builder().id(1000003).name("SK하이닉스 DDR5-5600 (32GB)").price(169000).regDate(new Date()).build());
        products.add(Product.builder().id(1000004).name("NVIDIA H100 HBM3 94GB NVL").price(41000000).regDate(new Date()).build());
        products.add(Product.builder().id(1000005).name("삼성전자 990 PRO M.2 NVMe (2TB)").price(290000).regDate(new Date()).build());
        model.addAttribute("products", products);

        log.info("product get page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");
        return "index";
    }
}
