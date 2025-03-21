<template>
  <div class="ai-chat-container">
    <div class="header-bar">
      <div class="header-content">
        <el-avatar :src="aiAvatar" size="medium" class="header-avatar"></el-avatar>
        <h1 class="system-title">欢迎进入智学求索</h1>
      </div>
    </div>
    <div class="message-viewport" ref="messageContainer">
      <transition-group name="message-slide" tag="div">
        <div v-for="(msg, index) in messages" :key="index" :class="['message-bubble', {
          'ai-bubble': msg.isAI,
          'user-bubble': !msg.isAI,
          'error-bubble': msg.isError
        }]">
          <div v-if="msg.isAI" class="bubble-wrapper ai">
            <el-avatar :src="aiAvatar" size="small" class="avatar"></el-avatar>
            <div class="bubble-content">
              <div class="content-box">
                <vue-markdown :source="msg.text" class="markdown-content"></vue-markdown>
                <div class="message-meta">
                  <el-tag v-if="msg.isError" type="danger" size="mini">错误</el-tag>
                  <span class="timestamp">{{ msg.time | formatTime }}</span>
                  <i class="el-icon-document-copy copy-btn" @click="copyText(msg.text)"></i>
                </div>
              </div>
            </div>
          </div>
          <div v-else class="bubble-wrapper user">
            <div class="bubble-content">
              <div class="content-box">
                <vue-markdown :source="msg.text" class="markdown-content"></vue-markdown>
                <div class="message-meta">
                  <span class="timestamp">{{ msg.time | formatTime }}</span>
                  <i class="el-icon-document-copy copy-btn" @click="copyText(msg.text)"></i>
                </div>
              </div>
            </div>
            <el-avatar :src="userAvatar" size="small" class="avatar"></el-avatar>
          </div>
        </div>
      </transition-group>
      <div v-if="loading" class="loading-indicator">
        <div class="dot-pulse">
          <div class="dot"></div>
          <div class="dot"></div>
          <div class="dot"></div>
        </div>
        <span>AI正在思考中...</span>
      </div>
    </div>
    <div class="input-area">
      <div class="input-wrapper">
        <el-input type="textarea" :rows="3" v-model="inputMessage" placeholder="请输入您的问题..." resize="none"
          class="smart-input" @keyup.enter.native="handleSend">
          <template slot="append">
            <el-button type="primary" :disabled="!inputMessage.trim() || loading" @click="handleSend"
              class="send-button">
              <i class="el-icon-s-promotion"></i>
              发送
            </el-button>
          </template>
        </el-input>
        <el-button class="mobile-send-button" type="primary" :disabled="!inputMessage.trim() || loading"
          @click="handleSend">
          <i class="el-icon-s-promotion"></i>
        </el-button>
      </div>
    </div>
  </div>
</template>

<script>
import ai from '@/api/ai';
import VueMarkdown from 'vue-markdown';

export default {
  components: { VueMarkdown },
  data() {
    return {
      messages: [],
      inputMessage: '',
      loading: false,
      aiAvatar: require('@/assets/ai-avatar.png'),
      userAvatar: require('@/assets/avatar.png')
    };
  },
  created() {
    this.loadHistory();
  },
  filters: {
    formatTime(timestamp) {
      const date = new Date(timestamp);
      return date.toLocaleString('zh-CN', {
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
      });
    }
  },
  methods: {
    async loadHistory() {
      try {
        const res = await ai.getHistory();
        if (res?.data?.code === 1) {
          this.messages = (res.data.response || []).map(item => {
            if (!item.isAI) {
              try {
                const contentObj = JSON.parse(item.content);
                return {
                  text: contentObj.message || '[空消息]',
                  isAI: item.isAI,
                  time: new Date(item.createdAt).getTime()
                };
              } catch (e) {
                console.error('用户消息解析失败:', item.content);
                return {
                  text: '消息格式异常',
                  isAI: item.isAI,
                  time: new Date(item.createdAt).getTime(),
                  isError: true
                };
              }
            }
            return {
              text: item.content,
              isAI: item.isAI,
              time: new Date(item.createdAt).getTime()
            };
          }).sort((a, b) => a.time - b.time);
        }
      } catch (error) {
        console.error('加载失败:', error);
      }
    },
    async handleSend() {
      if (!this.inputMessage.trim()) return;

      const userMsg = {
        text: this.inputMessage,
        isAI: false,
        time: Date.now()
      };
      this.messages.push(userMsg);
      this.loading = true;

      try {
        const res = await ai.chat(this.inputMessage);
        this.messages.push({
          text: res.data.response,
          isAI: true,
          time: Date.now()
        });
      } catch (error) {
        this.messages.push({
          text: "⚠️ 服务器繁忙，请稍后再试",
          isAI: true,
          time: Date.now(),
          isError: true
        });
      } finally {
        this.loading = false;
        this.inputMessage = '';
        this.scrollToBottom();
      }
    },
    scrollToBottom() {
      this.$nextTick(() => {
        const container = this.$refs.messageContainer;
        container.scrollTop = container.scrollHeight;
      });
    },
    copyText(text) {
      navigator.clipboard.writeText(text);
      this.$message.success('内容已复制');
    }
  }
};
</script>
<style lang="scss" scoped>
$ai-color: #2C6DF6;
$user-color: #10B981;
$error-color: #EF4444;
$shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.08);
$shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);

.ai-chat-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
  background: #F8FAFC;
}

.header-bar {
  padding: 16px 24px;
  background: white;
  box-shadow: $shadow-sm;
  position: relative;
  z-index: 10;

  .header-content {
    display: flex;
    align-items: center;
    gap: 16px;

    .header-avatar {
      width: 50px;
      height: 50px;
      box-shadow: $shadow-md;
    }

    .system-title {
      margin: 0;
      font-size: 20px;
      color: #1F2937;
      font-weight: 600;
    }
  }
}

.message-viewport {
  flex: 1;
  overflow-y: auto;
  padding: 24px 12%;
  scroll-behavior: smooth;
  padding-bottom: 160px;

  &::-webkit-scrollbar {
    width: 8px;
  }

  &::-webkit-scrollbar-thumb {
    background: #CBD5E1;
    border-radius: 4px;
  }
}

.message-bubble {
  margin: 20px 0;

  .bubble-wrapper {
    display: flex;
    gap: 12px;
    align-items: flex-start;

    &.ai {
      flex-direction: row;
    }

    &.user {
      flex-direction: row;
      justify-content: flex-end;

      .bubble-content {
        margin-left: 0;
        margin-right: 12px;
      }
    }

    .avatar {
      width: 50px;
      height: 50px;
      flex-shrink: 0;
      box-shadow: $shadow-md;
    }

    .bubble-content {
      max-width: 75%;
      min-width: 200px;
      overflow: hidden;

      .content-box {
        position: relative;
        padding: 16px;
        border-radius: 12px;
        box-shadow: $shadow-md;

        &::before {
          content: '';
          position: absolute;
          top: 12px;
          border: 8px solid transparent;
        }
      }
    }
  }

  &.ai-bubble {
    .content-box {
      background: white;
      border-radius: 0 16px 16px 16px;
      margin-left: 12px;

      &::before {
        left: -16px;
        border-right-color: white;
      }
    }
  }

  &.user-bubble {
    .content-box {
      background: $user-color;
      color: white;
      border-radius: 16px 0 16px 16px;
      margin-right: 10px;

      &::before {
        right: -16px;
        border-left-color: $user-color;
      }
    }

    .message-meta {
      color: rgba(white, 0.9);
    }
  }

  &.error-bubble {
    .content-box {
      background: $error-color !important;

      &::before {
        border-right-color: $error-color !important;
      }
    }
  }

  .markdown-content {
    line-height: 1.6;
    font-size: 15px;

    pre {
      background: #1E293B;
      color: #F8FAFC;
      padding: 12px;
      border-radius: 8px;
      margin: 12px 0;
      overflow-x: auto;
    }

    code {
      padding: 2px 6px;
      background: rgba(black, 0.1);
      border-radius: 4px;
      font-size: 14px;
    }
  }

  .message-meta {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 12px;
    margin-top: 12px;
    font-size: 12px;

    .timestamp {
      opacity: 0.8;
    }

    .copy-btn {
      cursor: pointer;
      transition: opacity 0.2s;
      opacity: 0.7;

      &:hover {
        opacity: 1;
      }
    }
  }
}

.loading-indicator {
  text-align: center;
  padding: 24px;
  color: #64748B;

  .dot-pulse {
    display: inline-flex;
    gap: 8px;
    margin-right: 12px;

    .dot {
      width: 8px;
      height: 8px;
      background: $ai-color;
      border-radius: 50%;
      animation: pulse 1.4s infinite ease-in-out;

      &:nth-child(1) {
        animation-delay: 0s
      }

      &:nth-child(2) {
        animation-delay: 0.2s
      }

      &:nth-child(3) {
        animation-delay: 0.4s
      }
    }
  }
}

.input-area {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  background: white;
  padding: 16px 24px;
  box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.05);
  z-index: 100;

  .input-wrapper {
    max-width: 800px;
    margin: 0 auto;
    position: relative;

    ::v-deep .el-textarea__inner {
      border-radius: 12px;
      padding-right: 100px;
      border: 1px solid #E2E8F0;
      transition: all 0.2s;

      &:focus {
        border-color: $ai-color;
        box-shadow: 0 0 0 3px rgba($ai-color, 0.1);
      }
    }

    .send-button {
      position: absolute;
      right: 16px;
      bottom: 12px;
      padding: 8px 20px;
      border-radius: 8px;
      box-shadow: $shadow-sm;
      transition: all 0.2s;

      &:hover {
        transform: translateY(-1px);
        box-shadow: $shadow-md;
      }
    }

    .mobile-send-button {
      display: none;
      position: absolute;
      right: 16px;
      bottom: 16px;
      padding: 12px;
      border-radius: 50%;
    }
  }
}

@media (max-width: 768px) {
  .message-viewport {
    padding: 16px;
    padding-bottom: 120px;
  }

  .input-area {
    padding: 12px 16px;

    .input-wrapper {
      ::v-deep .el-textarea__inner {
        padding-right: 60px;
      }

      .send-button {
        display: none;
      }

      .mobile-send-button {
        display: block;
      }
    }
  }
}

@keyframes pulse {

  0%,
  100% {
    transform: scale(0.9);
    opacity: 0.6;
  }

  50% {
    transform: scale(1.1);
    opacity: 1;
  }
}

.message-slide-enter-active {
  transition: all 0.3s cubic-bezier(0.18, 0.89, 0.32, 1.28);
}

.message-slide-leave-active {
  transition: all 0.2s ease-in;
}

.message-slide-enter {
  opacity: 0;
  transform: translateY(20px);
}
.ai-chat-container {
  display: flex;
  flex-direction: column;
  height: 100vh;
  background: linear-gradient(135deg, #f0f8ff 0%, #e6f2ff 100%); 
}
</style>
