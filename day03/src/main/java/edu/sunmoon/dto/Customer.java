package edu.sunmoon.dto;

import lombok.*;

@Data
@Builder
public class Customer {
    private String id;
    private String pw;
    private String name;
}
