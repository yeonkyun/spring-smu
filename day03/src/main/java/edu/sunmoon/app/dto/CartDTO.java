package edu.sunmoon.app.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class CartDTO {
    private int cartId;
    private String customerId;
    private int itemId;
    private int quantity;
    private LocalDateTime regDate;
}
