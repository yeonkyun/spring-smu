package edu.sunmoon.controller;

import com.github.pagehelper.PageInfo;
import edu.sunmoon.app.dto.CustomerDTO;
import edu.sunmoon.app.dto.ItemDTO;
import edu.sunmoon.app.dto.Search;
import edu.sunmoon.app.service.ItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/item")
public class ItemController {
    final ItemService itemService;
    String dir = "item/";

    @RequestMapping("")
    public String item(Model model) {
        log.info("item page called");
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "center");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
        log.info("item get page called");
        PageInfo<ItemDTO> pageInfo;
        try {
            pageInfo = new PageInfo<>(itemService.getpage(pageNo), 5);
            model.addAttribute("pageInfo", pageInfo);
            model.addAttribute("target", "/item");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "get");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) {
        log.info("item detail page called");
        ItemDTO itemDTO;
        try {
            itemDTO = itemService.get(id);
            model.addAttribute("item", itemDTO);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "detail");
        return "index";
    }

    @GetMapping("/search")
    public String search(
            Model model,
            Search search,
            @RequestParam(defaultValue = "1") int pageNo) {

        log.info("Searching items with criteria: {}, page: {}", search, pageNo);

        try {
            List<ItemDTO> searchResults = itemService.search(search, pageNo);
            PageInfo<ItemDTO> pageInfo = new PageInfo<>(searchResults, pageNo);

            return populateModel(model, pageInfo);
        } catch (Exception e) {
            log.error("Failed to search items: {}", e.getMessage(), e);
            throw new RuntimeException("아이템 검색 중 오류가 발생했습니다", e);
        }
    }

    private String populateModel(Model model, PageInfo<ItemDTO> pageInfo) {
        model.addAttribute("pageInfo", pageInfo)
                .addAttribute("target", "item")
                .addAttribute("left", dir + "left")
                .addAttribute("center", dir + "get");

        return "index";
    }

}
