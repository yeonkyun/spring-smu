package edu.sunmoon.controller;

import edu.sunmoon.dto.Marker;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RestController
@Slf4j
public class AjaxRestController {
    @RequestMapping("/getctime")
    public Object getctime() {
        JSONObject obj = new JSONObject();
        LocalDateTime currentTime = LocalDateTime.now();
        obj.put("currentTime", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(currentTime));
        return obj;
    }

    @RequestMapping("/getrank")
    public Object getrank() {
        JSONArray jsonArray = new JSONArray();
        String[] keywords = {"아이폰", "아이패드", "맥북", "애플워치", "에어팟", "아이맥", "맥미니", "애플펜슬", "애플TV", "홈팟"};
        int[] counts = new int[keywords.length];
        for (int i = 0; i < counts.length; i++) {
            counts[i] = (int) (Math.random() * 100);
        }
        for (int i = 0; i < counts.length; i++) {
            for (int j = i + 1; j < counts.length; j++) {
                if (counts[i] < counts[j]) {
                    int temp = counts[i];
                    counts[i] = counts[j];
                    counts[j] = temp;
                    String tempStr = keywords[i];
                    keywords[i] = keywords[j];
                    keywords[j] = tempStr;
                }
            }
        }
        for (int i = 0; i < counts.length; i++) {
            JSONObject obj = new JSONObject();
            obj.put("rank", i + 1);
            obj.put("keyword", keywords[i]);
            jsonArray.add(obj);
        }
        log.info("서버에서 반환하는 데이터: {}", jsonArray.toJSONString()); // Log the data
        return jsonArray;
    }

    @RequestMapping("/checkid")
    public Object checkid(@RequestParam("rid") String id) {
        JSONObject obj = new JSONObject();
        if (id.equals("aaaa") || id.equals("aaaaa")) {
            obj.put("result", "1");
        } else {
            obj.put("result", "0");
        }
        return obj;
    }

    @RequestMapping("/getmarkers")
    public Object getmarkers(@RequestParam("target") int target) {
        log.info("target: {}", target);
        List<Marker> markers = new ArrayList<>();
        if (target == 100) {
            markers.add(Marker.builder().lat(37.564472).lng(126.990841).title("순대국1").img("https://thingool123.godohosting.com/data/goods/22/08/31/1000025407/1000025407_detail_09.png").code(101).build());
            markers.add(Marker.builder().lat(37.544472).lng(126.970841).title("순대국2").img("https://d2u1z1lopyfwlx.cloudfront.net/thumbnails/62071c76-c515-5cd9-8dd0-68e6382d37de/35954d60-dfbb-5abd-ad61-726431056f09.jpg").code(102).build());
            markers.add(Marker.builder().lat(37.564472).lng(126.970841).title("순대국3").img("https://sitem.ssgcdn.com/29/37/35/item/1000283353729_i1_750.jpg").code(103).build());
        } else if (target == 200) {
            markers.add(Marker.builder().lat(35.185109).lng(129.175474).title("밀면").img("https://blog.kakaocdn.net/dn/bdx7Cs/btsICo5MbcT/sYHlzNnUKqfKniyfxEpHc0/img.jpg").code(201).build());
            markers.add(Marker.builder().lat(35.165109).lng(129.185474).title("돼지국밥").img("https://sitem.ssgcdn.com/92/76/94/item/1000179947692_i1_750.jpg").code(202).build());
            markers.add(Marker.builder().lat(35.175109).lng(129.185474).title("씨앗호떡").img("https://thenaum.cdn-nhncommerce.com/data/goods/18/03/13/1000001621/1000001621_detail_071.jpg").code(203).build());
        } else if (target == 300) {
            markers.add(Marker.builder().lat(33.264564).lng(126.560944).title("흑돼지").img("https://pimg.mk.co.kr/meet/neds/2021/04/image_readtop_2021_386417_16190316624618254.jpg").code(301).build());
            markers.add(Marker.builder().lat(33.244564).lng(126.560944).title("돔베국수").img("https://thenaum.cdn-nhncommerce.com/data/goods/20/03/12/1000002856/1000002856_detail_089.jpg").code(302).build());
            markers.add(Marker.builder().lat(33.254564).lng(126.570944).title("갈치조림").img("https://recipe1.ezmember.co.kr/cache/recipe/2022/09/04/37a1f64e7f0b5d2b5f89e92c4ef33a371.jpg").code(303).build());
        } else {

        }
        return markers;
    }

    @RequestMapping("/getbike")
    public Object getbike() {
        JSONObject obj = new JSONObject();
        // 36.800269, 127.074960
        double lat = 36.800269;
        double lng = 127.074960;

        // 소수점 3번째 자리 변경
        Random random = new Random();
        lat += random.nextInt(1000) / 1000000.0;
        lng += random.nextInt(1000) / 1000000.0;

        obj.put("lat", lat);
        obj.put("lng", lng);

        return obj;
    }
}