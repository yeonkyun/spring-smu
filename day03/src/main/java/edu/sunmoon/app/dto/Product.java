package edu.sunmoon.app.dto;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class Product {
    private int id;
    private String name;
    private int price;
    private String img;
    private Date regDate;
}
