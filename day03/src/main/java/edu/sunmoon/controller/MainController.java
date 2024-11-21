package edu.sunmoon.controller;

import edu.sunmoon.app.dto.OcrDto;
import edu.sunmoon.util.FileUploadUtil;
import edu.sunmoon.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Controller
@Slf4j
public class MainController {

    @Value("${app.dir.uploadimgdir}")
    private String uploadImgDir;

    @Value("${app.url.server-url}")
    private String serverUrl;

    @Value("${naver.api.gateway-url}")
    private String naverApiGatewayUrl;

    @Value("${naver.api.secret-key}")
    private String naverApiSecretKey;

    @RequestMapping("/")
    public String main(Model model) {
        log.info("index page called");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        log.info("login page called");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        log.info("register page called");
        return "index";
    }

    @Value("${kakao.api.key}")
    private String kakaoApiKey;

    @RequestMapping("/about")
    public String about(Model model) {
        model.addAttribute("kakaoApiKey", kakaoApiKey);
        model.addAttribute("center", "about");
        log.info("about page called");
        return "index";
    }

    @RequestMapping("/webcam")
    public String webcam(Model model) {
        log.info("webcam page called");
        model.addAttribute("center", "webcam");
        return "index";
    }

    @RequestMapping("/saveimg")
    @ResponseBody
    public String saveimg(@RequestParam("file") MultipartFile file) throws IOException {
        String imgname = file.getOriginalFilename();
        FileUploadUtil.saveFile(file, uploadImgDir);
        return imgname;
    }

    @RequestMapping("/websocket")
    public String websocket(Model model) {
        log.info("websocket page called");
        model.addAttribute("center", "websocket");
        model.addAttribute("serverurl", serverUrl);
        return "index";
    }

    @RequestMapping("/chat")
    public String chat(Model model) {
        log.info("chat page called");
        model.addAttribute("center", "chat");
        model.addAttribute("serverurl", serverUrl);
        return "index";
    }

    @RequestMapping("/ocr")
    public String ocr(Model model){
        model.addAttribute("center","ocr");
        return "index";
    }

    @RequestMapping("/ocrimpl")
    public String ocrimpl(Model model, OcrDto ocrDto) throws IOException {
        String imgname = ocrDto.getImage().getOriginalFilename();

        FileUploadUtil.saveFile(ocrDto.getImage(), uploadImgDir);
        JSONObject jsonObject = OCRUtil.getResult(uploadImgDir, imgname, naverApiGatewayUrl, naverApiSecretKey);
        Map<String, String> map = OCRUtil.getData(jsonObject);

        model.addAttribute("result",map);
        model.addAttribute("imgname",imgname);
        model.addAttribute("center","ocr");
        return "index";
    }
}
