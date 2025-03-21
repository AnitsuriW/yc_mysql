package com.mindskip.xzs.service;

import com.mindskip.xzs.domain.AIConversation;
import com.mindskip.xzs.repository.AIConversationMapper;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Slf4j
@Service
public class AIService {

    private final AIConversationMapper conversationMapper;
    private final RestTemplate restTemplate;
    private final String apiUrl;
    private final String apiKey;
    private final String modelId;
    private final Map<String, Object> apiParams;

    @Autowired
    public AIService(AIConversationMapper conversationMapper,
                     RestTemplate restTemplate,
                     @Value("${deepseek.api.url}") String apiUrl,
                     @Value("${deepseek.api.key}") String apiKey,
                     @Value("${deepseek.api.model}") String modelId,
                     @Value("${deepseek.params.temperature}") double temperature,
                     @Value("${deepseek.params.top_p}") double topP,
                     @Value("${deepseek.params.top_k}") int topK,
                     @Value("${deepseek.params.max_tokens}") int maxTokens) {

        this.conversationMapper = conversationMapper;
        this.restTemplate = restTemplate;
        this.apiUrl = apiUrl;
        this.apiKey = apiKey;
        this.modelId = modelId;

        // 初始化API参数
        this.apiParams = new HashMap<>();
        this.apiParams.put("temperature", temperature);
        this.apiParams.put("top_p", topP);
        this.apiParams.put("top_k", topK);
        this.apiParams.put("max_tokens", maxTokens);
    }

    @Transactional(rollbackFor = Exception.class)
    public String processMessage(String message) {
        saveConversation(message, false);

        try {
            String aiResponse = callAPIWithRetry(message);
            saveConversation(aiResponse, true);
            return aiResponse;
        } catch (ApiException e) {
            log.error("API调用失败 [Code: {}]: {}", e.getCode(), e.getMessage());
            saveErrorResponse(e.getMessage());
            throw new RuntimeException(formatErrorMessage(e));
        }
    }

    private void saveConversation(String content, boolean isAI) {
        AIConversation record = new AIConversation();
        record.setContent(content);
        record.setAi(isAI);
        record.setCreatedAt(new Date());
        conversationMapper.insert(record);
    }

    private String callAPIWithRetry(String userMessage) {
        int retries = 3;
        while (retries > 0) {
            try {
                return callAPI(userMessage);
            } catch (RateLimitException e) {
                log.warn("触发限流，剩余重试次数: {}", retries);
                try {
                    Thread.sleep(1000 * (4 - retries)); // 指数退避
                } catch (InterruptedException ex) {
                    Thread.currentThread().interrupt();
                }
                retries--;
            }
        }
        throw new ApiException("API请求超限，请稍后再试", "700001");
    }

    private String callAPI(String userMessage) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(apiKey);

        ApiRequest request = buildRequest(userMessage);

        log.debug("API请求参数: {}", request);

        ResponseEntity<ApiResponse> response = restTemplate.exchange(
                apiUrl,
                HttpMethod.POST,
                new HttpEntity<>(request, headers),
                ApiResponse.class
        );

        validateResponse(response);
        return extractContent(response.getBody());
    }

    private ApiRequest buildRequest(String userMessage) {
        ApiRequest request = new ApiRequest();
        request.setModel(modelId);
        request.setMessages(Collections.singletonList(
                new ApiRequest.Message("user", userMessage)
        ));
        request.setTemperature((Double) apiParams.get("temperature"));
        request.setTop_p((Double) apiParams.get("top_p"));
        request.setTop_k((Integer) apiParams.get("top_k"));
        request.setMax_tokens((Integer) apiParams.get("max_tokens"));

        return request;
    }

    private void validateResponse(ResponseEntity<ApiResponse> response) {
        if (response.getStatusCode() != HttpStatus.OK) {
            throw new ApiException("HTTP状态码异常: " + response.getStatusCode(), "500001");
        }

        ApiResponse body = response.getBody();
        if (body == null) {
            throw new ApiException("空响应体", "500001");
        }

        if (body.getCode() != 0) {
            handleErrorCode(body.getError());
        }
    }

    private void handleErrorCode(ApiResponse.Error error) {
        switch (error.getCode()) {
            case "500004":
                throw new ApiException("无效的AppKey", "500004");
            case "700001":
                throw new RateLimitException("请求频率超限");
            case "700002":
                throw new RateLimitException("Token消耗超限");
            default:
                throw new ApiException(error.getMessage(), error.getCode());
        }
    }

    private String extractContent(ApiResponse response) {
        return response.getChoices().stream()
                .findFirst()
                .map(ApiResponse.Choice::getMessage)
                .map(ApiResponse.Message::getContent)
                .orElseThrow(() -> new ApiException("无效的响应格式", "500001"));
    }

    private String formatErrorMessage(ApiException e) {
        switch (e.getCode()) {
            case "500004":
                return "API密钥错误，请联系管理员";
            case "700001":
                return "请求过于频繁，请稍后再试";
            case "700002":
                return "内容过长，请简化问题";
            default:
                return "服务暂时不可用：" + e.getMessage();
        }
    }

    private void saveErrorResponse(String error) {
        AIConversation record = new AIConversation();
        record.setContent("[ERROR] " + error);
        record.setAi(true);
        record.setCreatedAt(new Date());
        conversationMapper.insert(record);
    }

    public List<AIConversation> getAllConversations() {
        return conversationMapper.selectAllOrderByTime();
    }

    private ApiRequest buildAnalysisRequest(String questionContent) {
        ApiRequest request = new ApiRequest();
        request.setModel(modelId);
        List<ApiRequest.Message> messages = new ArrayList<>();
        messages.add(new ApiRequest.Message("user", "你现在是一个一键AI解析助手，请先给明确出答案，在进行简短的解析："+ questionContent));
        log.info(messages.toString());
        request.setMessages(messages);
        request.setTemperature(0.2);
        request.setTop_p(0.9);
        request.setMax_tokens(500);
        return request;
    }

    public String analyzeQuestion(String decodedQuestion) {
        try {
            if (decodedQuestion == null || decodedQuestion.trim().isEmpty()) {
                throw new ApiException("题目内容为空", "400");
            }
            ApiRequest request = buildAnalysisRequest(decodedQuestion);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setBearerAuth(apiKey);
            ResponseEntity<ApiResponse> response = restTemplate.exchange(
                    apiUrl,
                    HttpMethod.POST,
                    new HttpEntity<>(request, headers),
                    ApiResponse.class
            );

            if (response.getStatusCode() != HttpStatus.OK) {
                throw new ApiException("API状态码异常: " + response.getStatusCode(), "500");
            }

            ApiResponse body = response.getBody();
            if (body == null || body.getChoices() == null || body.getChoices().isEmpty()) {
                throw new ApiException("响应内容格式错误", "500");
            }
            return body.getChoices().get(0).getMessage().getContent();
        } catch (HttpClientErrorException e) {
            log.error("API请求失败[状态码:{}] 响应:{}", e.getStatusCode(), e.getResponseBodyAsString());
            throw new ApiException("AI服务异常: " + e.getStatusText(), "503");
        } catch (RestClientException e) {
            log.error("网络通信异常: {}", e.getMessage());
            throw new ApiException("服务不可用", "503");
        } catch (Exception e) {
            log.error("系统内部错误: ", e);
            throw new ApiException("系统内部错误", "500");
        }
    }
    @Data
    static class ApiRequest {
        private String model;
        private List<Message> messages;
        private Double temperature;
        private Double top_p;
        private Integer top_k;
        private Integer max_tokens;

        @Data
        static class Message {
            private String role;
            private String content;

            public Message(String role, String content) {
                this.role = role;
                this.content = content;
            }
        }
    }

    @Data
    static class ApiResponse {
        private int code;
        private List<Choice> choices;
        private Error error;
        private Usage usage;

        @Data
        static class Choice {
            private Message message;
            private String finish_reason;
        }

        @Data
        static class Message {
            private String role;
            private String content;
        }

        @Data
        static class Error {
            private String code;
            private String type;
            private String message;
        }

        @Data
        static class Usage {
            private int prompt_tokens;
            private int completion_tokens;
            private int total_tokens;
        }
    }
    public static class ApiException extends RuntimeException {
        private final String code;

        public ApiException(String message, String code) {
            super(message);
            this.code = code;
        }

        public String getCode() {
            return code;
        }
    }

    public static class RateLimitException extends ApiException {
        public RateLimitException(String message) {
            super(message, "700001");
        }
    }
}