package edu.sunmoon.app.dto;

import lombok.*;

@Data
@Builder
public class CustomerDTO {
    private String id;
    private String pw;
    private String name;
}
