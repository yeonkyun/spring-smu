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
public class ItemDTO {
    private int itemId;
    private String itemName;
    private int itemPrice;
    private String imgName;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
}
