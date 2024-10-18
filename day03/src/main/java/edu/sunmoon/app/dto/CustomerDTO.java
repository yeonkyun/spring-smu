package edu.sunmoon.app.dto;

import lombok.*;

@Data
@Builder
public class CustomerDTO {
    private String customerId;
    private String customerPw;
    private String customerName;
}
