package edu.sunmoon;

import lombok.extern.slf4j.Slf4j;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootTest
@Slf4j
class PasswordTests {

    @Autowired
    BCryptPasswordEncoder encoder;
    @Autowired
    StandardPBEStringEncryptor textEncoder;

    @Test
    void contextLoads() {
        String pwd = "abc";
        String encPwd = encoder.encode(pwd);
        log.info("Pwd: " + pwd);
        log.info("Enc Pwd: " + encPwd);

        String inputPwd = "abc";

        boolean result1 = encoder.matches(inputPwd, encPwd);
        log.info("result 1 : " + result1);

        String encText = textEncoder.encrypt("서울시");
        log.info("text Encodint 1 : " + encText);
        log.info("text Encodint 1 : " + textEncoder.decrypt(encText));
    }
}