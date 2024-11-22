package edu.sunmoon.ncp;

import edu.sunmoon.util.ChatBotUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class ChatbotTests {
    @Value("${naver.api.chatbot.gateway-url}")
    private String chatBotGatewayUrl;

    @Value("${naver.api.chatbot.secret-key}")
    private String chatBotSecretKey;

    @Test
    void contextLoads() throws Exception {
        String sendMsg = "채팅하자";
        String response = ChatBotUtil.getMsg(chatBotGatewayUrl, chatBotSecretKey, sendMsg);
        log.info("response: " + response);
    }
}
