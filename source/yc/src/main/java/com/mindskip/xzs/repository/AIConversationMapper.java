package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.AIConversation;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AIConversationMapper {
    @Insert("INSERT INTO ai_conversation (content, is_ai, created_at) VALUES (#{content}, #{ai}, #{createdAt})")
    int insert(AIConversation conversation);

    @Select("SELECT id, content, is_ai as ai, created_at as createdAt FROM ai_conversation ORDER BY created_at DESC")
    List<AIConversation> selectAllOrderByTime();
}