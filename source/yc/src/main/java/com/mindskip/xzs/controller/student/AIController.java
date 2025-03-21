package com.mindskip.xzs.controller.student;

import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.AIConversation;
import com.mindskip.xzs.domain.dto.AIChatRequest;
import com.mindskip.xzs.service.AIService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
@Slf4j
@RestController
@RequestMapping("/api/ai")
public class AIController {

    private final AIService aiService;

    @Autowired
    public AIController(AIService aiService) {
        this.aiService = aiService;
    }

    @PostMapping("/chat")
    public RestResponse<String> handleChat(@RequestBody String message) {
        try {
            String response = aiService.processMessage(message);
            return RestResponse.ok(response);
        } catch (Exception e) {
            return RestResponse.fail(500, "服务异常"); // 明确状态码和消息
        }
    }
    @GetMapping("/history")
    public RestResponse<List<AIConversation>> getHistory() {
        try {
            List<AIConversation> data = aiService.getAllConversations();
            return RestResponse.ok(Optional.ofNullable(data).orElse(Collections.emptyList()));
        } catch (Exception e) {
            return RestResponse.fail(500, "数据查询失败");
        }
    }
    @PostMapping("/analyze-question")
    public RestResponse<String> analyzeQuestion(@RequestBody @Valid AIChatRequest request) {
        try {
            if (request.getMessage() == null || request.getMessage().trim().isEmpty()) {
                return RestResponse.fail(400, "请求参数不能为空");
            }
            String decodedQuestion = URLDecoder.decode(request.getMessage(), "UTF-8");
            String analysis = aiService.analyzeQuestion(decodedQuestion);
            return RestResponse.ok(analysis);
        } catch (UnsupportedEncodingException e) {
            return RestResponse.fail(400, "参数编码错误");
        } catch (AIService.ApiException e) {
            return RestResponse.fail(Integer.parseInt(e.getCode()), e.getMessage());
        } catch (Exception e) {
            log.error("系统内部错误: {}", e.getMessage());
            return RestResponse.fail(500, "系统内部错误");
        }
    }
}