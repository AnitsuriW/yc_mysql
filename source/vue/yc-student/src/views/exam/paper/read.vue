<template>
  <div>
    <el-row class="do-exam-title" style="background-color: #F5F5DC">
      <el-col :span="24">
        <span :key="item.itemOrder" v-for="item in answer.answerItems">
          <el-tag :type="questionDoRightTag(item.doRight)" class="do-exam-title-tag"
            @click="goAnchor('#question-' + item.itemOrder)">{{ item.itemOrder }}</el-tag>
        </span>
      </el-col>
    </el-row>
    <el-row class="do-exam-hidden">
      <el-col :span="24">
        <span :key="item.itemOrder" v-for="item in answer.answerItems">
          <el-tag class="do-exam-title-tag">{{ item.itemOrder }}</el-tag>
        </span>
      </el-col>
    </el-row>
    <el-container class="app-item-contain">
      <el-header class="align-center">
        <h1>{{ form.name }}</h1>
        <div>
          <span class="question-title-padding">试卷得分：{{ answer.score }}</span>
          <span class="question-title-padding">试卷耗时：{{ formatSeconds(answer.doTime) }}</span>
        </div>
      </el-header>
      <el-main>
        <el-form :model="form" ref="form" v-loading="formLoading" label-width="100px">
          <el-row :key="index" v-for="(titleItem, index) in form.titleItems">
            <h3>{{ titleItem.name }}</h3>
            <el-card class="exampaper-item-box question-background" v-if="titleItem.questionItems.length !== 0">
              <el-form-item :key="questionItem.itemOrder" :label="questionItem.itemOrder + '.'"
                v-for="questionItem in titleItem.questionItems" class="exam-question-item" label-width="50px"
                :id="'question-' + questionItem.itemOrder">
                <QuestionAnswerShow :qType="questionItem.questionType" :question="questionItem"
                  :answer="answer.answerItems[questionItem.itemOrder - 1]" />
                <el-button type="text" size="mini" @click="handleAiAnalysis(questionItem)" class="ai-analysis-btn">
                  <span v-if="!questionItem.aiLoading">AI解析</span>
                  <i v-else class="el-icon-loading"></i>
                </el-button>
                <div v-if="questionItem.aiAnalysis" class="ai-analysis-result">
                  <el-alert :title="questionItem.aiAnalysis || '暂无解析内容'" type="info" style="color: black;">
                  </el-alert>
                </div>
              </el-form-item>
            </el-card>
          </el-row>
        </el-form>
      </el-main>
    </el-container>
  </div>
</template>
<script>
import { mapState, mapGetters } from 'vuex'
import { formatSeconds } from '@/utils'
import QuestionAnswerShow from '../components/QuestionAnswerShow'
import examPaperAnswerApi from '@/api/examPaperAnswer'
export default {
  components: { QuestionAnswerShow },
  data() {
    return {
      form: {},
      formLoading: false,
      answer: {
        id: null,
        score: 0,
        doTime: 0,
        answerItems: [],
        doRight: false
      }
    }
  },
  created() {
    let id = this.$route.query.id;
    let _this = this;
    if (id && parseInt(id) !== 0) {
      _this.formLoading = true;
      examPaperAnswerApi.read(id).then(re => {
        _this.form = re.response.paper;
        _this.answer = re.response.answer;
        _this.form.titleItems.forEach(titleItem => {
          titleItem.questionItems.forEach(questionItem => {
            _this.$set(questionItem, 'aiLoading', false);
            _this.$set(questionItem, 'aiAnalysis', '');
          });
        });
        _this.formLoading = false;
      });
    }
    examPaperAnswerApi.read(id).then(re => {
      console.log('题目数据:', re.response.paper.titleItems);
    });
  },
  methods: {
    formatSeconds(theTime) {
      return formatSeconds(theTime)
    },
    questionDoRightTag(status) {
      return this.enumFormat(this.doRightTag, status)
    },
    goAnchor(selector) {
      this.$el.querySelector(selector).scrollIntoView({ behavior: 'instant', block: 'center', inline: 'nearest' })
    },
    async handleAiAnalysis(questionItem) {
      try {
        if (!this.$api || !this.$api.ai) {
          throw new Error('API 配置错误');
        }
        this.$set(questionItem, 'aiLoading', true);
        const questionTitle = questionItem.title || '';
        let optionsText = '';
        if ([1, 2].includes(questionItem.questionType)) {
          optionsText = questionItem.items.map(item =>
            `${item.prefix}. ${item.content}`
          ).join('\n');
        } else if (questionItem.questionType === 3) {
          optionsText = '正确\n错误';
        } else if (questionItem.questionType === 4) {
          await this.$nextTick();
          await new Promise(resolve => setTimeout(resolve, 50));
          const gapEl = this.$el.querySelector(
            `#question-${questionItem.itemOrder} .gapfilling-span`
          );
          optionsText = gapEl?.textContent
            ? `填空位置示例：${gapEl.textContent}`
            : '填空位置未找到';
        }
        if (!questionTitle && !optionsText) {
          throw new Error('题目和选项内容均为空');
        }
        const fullQuestionText = `${questionTitle}\n${optionsText}`.trim();
        const encodedQuestion = encodeURIComponent(fullQuestionText);
        console.log(encodedQuestion);
        const { code, response: aiResponse } = await this.$api.ai.analyzeQuestion({ message: encodedQuestion });
        if (code === 1) {
          this.$set(questionItem, 'aiAnalysis', aiResponse);
        } else {
          this.$message.error('解析失败: ' + (aiResponse || '未知错误'));
        }
      }
      catch (e) {
        this.$message.error(this.parseErrorMessage(e));
      }
      finally {
        this.$set(questionItem, 'aiLoading', false);
      }
    },
    extractQuestionContent(question) {
      return question.content || document.querySelector(
        `#question-${question.itemOrder} .q-title`
      ).innerText;
    },
    formatAiResponse(text) {
      return text.replace(/\n/g, '<br>').replace(/\d+\./g, match =>
        `<strong>${match}</strong>`
      );
    },
    parseErrorMessage(e) {
      if (e.response) {
        return `${e.response.status} ${e.response.data?.message || '服务异常'}`;
      }
      const message = e.message || e.toString();
      return message.replace(/^Error: /, '');
    },
    extractQuestionContent(question) {
      if (question.content) return question.content;
      const dom = document.querySelector(
        `#question-${question.itemOrder} .q-title`
      );
      return dom ? dom.innerText : '无法提取题目内容';
    }
  },
  extractQuestionContent(question) {
    return question.content || document.querySelector(`#question-${question.itemOrder} .q-title`).innerText;
  },
  computed: {
    ...mapGetters('enumItem', ['enumFormat']),
    ...mapState('enumItem', {
      doRightTag: state => state.exam.question.answer.doRightTag
    })
  }
}
</script>

<style lang="scss" scoped>
.align-center {
  text-align: center
}

.exam-question-item {
  padding: 10px;

  .el-form-item__label {
    font-size: 15px !important;
  }
}

.question-title-padding {
  padding-left: 25px;
  padding-right: 25px;
}

.ai-analysis-btn {
  margin-left: 10px;
  margin-top: 5px;
  color: #f6f6f6;
  border: 2px solid #409EFF;
  background-color: #409EFF;
  border-radius: 4px;
  font-size: 15px;

  &:hover {
    opacity: 0.8;
  }
}

.ai-analysis-result {
  margin-top: 10px;
  padding: 10px;
  background: #f4f4f5;
  border-radius: 4px;
  color: #000000;

  .correct-answer {
    color: #000000;
    font-weight: bold;
  }
}

.el-radio-group {
  .el-radio {
    margin: 5px 0;

    .question-prefix {
      color: #409EFF;
      margin-right: 8px;
    }

    .q-item-span-content {
      font-size: 14px;
    }
  }
}

.el-checkbox-group {
  .el-checkbox {
    margin: 5px 0;

    .question-prefix {
      color: #67C23A;
      margin-right: 8px;
    }

    .q-item-span-content {
      font-size: 14px;
    }
  }
}

.q-title {
  font-size: 16px;
  font-weight: 500;
  margin-bottom: 10px;
  color: #303133;
}
.ai-analysis-result {
  margin-top: 10px;
  padding: 10px;
  background: #f4f4f5; 
  border-radius: 4px;
  font-size: 15px;
  background: linear-gradient(135deg, #f0f8ff 0%, #e6f2ff 100%);
}
.align-center {
  text-align: center;
}

.exam-question-item {
  padding: 10px;
  background: linear-gradient(135deg, #e6f2ff 0%, #b3d9ff 100%);
  border-radius: 8px;
}

</style>
