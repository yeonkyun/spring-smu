package edu.sunmoon.scheduler;

import edu.sunmoon.app.dto.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class Scheduler {
    @Autowired
    private SimpMessageSendingOperations messagingTemplate;


    @Scheduled(cron = "*/15 * * * * *")
    public void cronJobDailyUpdate() {

        System.out.println("----------- Scheduler ------------");
        Msg msg = new Msg();
        Random r = new Random();
        int num = r.nextInt(100) + 1;
        msg.setContent1(num + "");
        messagingTemplate.convertAndSend("/send", msg);
    }

    @Scheduled(cron = "1 0 0 1,8,15,22 * *")
    public void cronJobWeeklyUpdate() {

    }


}