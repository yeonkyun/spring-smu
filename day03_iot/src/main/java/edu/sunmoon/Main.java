package edu.sunmoon;

import edu.sunmoon.util.HttpSendData;

import java.util.Random;

public class Main {
    public static void main(String[] args) {
        String url = "http://localhost:80/iot/power";
        String data = "100";

        Random random = new Random();
        for (int i = 0; i < 100; i++) {
            float num = random.nextFloat() * 100;
            HttpSendData.send(url, num + "");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}