package edu.sunmoon.controller;

import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
@Slf4j
public class ItemController {

    private final ItemService itemService;
    String dir = "item/";

    @Value("${app.dir.images}")
    String imgdir;

    @RequestMapping("/add")
    public String add(Model model) throws Exception {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, ItemDTO itemDTO) throws Exception {
        // 데이터 입력
        itemDTO.setImgName(itemDTO.getImage().getOriginalFilename());
        itemService.add(itemDTO);

        log.info("------------------------" + imgdir);
        return "redirect:/item/get";
    }

    @RequestMapping("/update")
    public String update(Model model, ItemDTO itemDTO) throws Exception {
        // id, name, price, imgname, or newimg
        itemService.modify(itemDTO);
        return "redirect:/item/detail?id=" + itemDTO.getItemId();
    }

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<ItemDTO> list = null;
        list = itemService.get();
        model.addAttribute("itemlist", list);
        model.addAttribute("center", dir + "get");


        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) throws Exception {
        ItemDTO itemDTO = null;

        itemDTO = itemService.get(id);
        model.addAttribute("item", itemDTO);
        model.addAttribute("center", dir + "detail");

        return "index";
    }

@RequestMapping("/delete")
public String delete(Model model, @RequestParam("id") int id) throws Exception {
    itemService.delete(id);
    return "redirect:/item/get";
}
}
