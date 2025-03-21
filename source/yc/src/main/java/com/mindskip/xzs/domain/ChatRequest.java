package com.mindskip.xzs.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
public class ChatRequest {
    private String model;
    private List<Message> messages;
    private double temperature;

    @Data
    @AllArgsConstructor
    public static class Message {
        private String role;
        private String content;
    }
}

