package edu.sunmoon.app.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Marker {
    private double lat;
    private double lng;
    private String title;
    private String img;
    private int code;
}
