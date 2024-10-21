package edu.sunmoon.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartDTO {
    private int cartId;
    private String customerId;
    private int itemId;
    private int quantity;
    private LocalDateTime regDate;

    private ItemDTO item;
}
