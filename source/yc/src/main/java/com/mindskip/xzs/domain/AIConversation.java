package com.mindskip.xzs.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Date;

public class AIConversation {
    private Long id;
    private String content;
    @JsonProperty("isAI")
    private Boolean ai;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdAt;

    // Getters
    public Long getId() { return id; }
    public String getContent() { return content; }
    public Boolean getAi() { return ai; } // MyBatis 通过此方法获取值
    public Date getCreatedAt() { return createdAt; }

    // Setters
    public void setId(Long id) { this.id = id; }
    public void setContent(String content) { this.content = content; }
    public void setAi(Boolean ai) { this.ai = ai; } // 修正方法名
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}