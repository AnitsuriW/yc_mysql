/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80037
Source Host           : localhost:8000
Source Database       : xzs

Target Server Type    : MYSQL
Target Server Version : 80037
File Encoding         : 65001

Date: 2025-03-24 13:06:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ai_conversation`
-- ----------------------------
DROP TABLE IF EXISTS `ai_conversation`;
CREATE TABLE `ai_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `is_ai` tinyint(1) NOT NULL COMMENT '0-用户 1-AI',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_time` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of ai_conversation
-- ----------------------------
INSERT INTO `ai_conversation` VALUES ('13', '{\"message\":\"什么是springboort\\n\"}', '0', '2025-03-05 08:50:04');
INSERT INTO `ai_conversation` VALUES ('14', '<think>\nOkay, I need to explain what Spring Boot is. It\'s a framework that simplifies building Java applications. I should mention that it\'s part of the Spring ecosystem and makes setting up and running apps easier. \n\nI\'ll talk about its key features, like the embedded server, which allows apps to run without external servers. Also, the Maven and Gradle plugins it uses for dependency management. \n\nIt\'s important to highlight how Spring Boot reduces boilerplate code and simplifies configuration. Maybe include some common use cases, such as building REST APIs or microservices. \n\nI should keep it simple and conversational, avoiding any technical jargon that might confuse someone new to Spring Boot. Make sure to cover the main points clearly and concisely.\n</think>\n\nSpring Boot 是一个用于简化 Spring 应用程序开发的框架。它使得构建独立的、生产级别的 Spring 应用程序更加容易。Spring Boot 提供了默认配置和自动化功能，减少了开发者在配置和设置上的工作量。\n\n### 主要特点：\n1. **嵌入式服务器**：Spring Boot 可以嵌入 Tomcat、Jetty 或者 Undertow 作为服务器，使得应用程序可以独立运行，而不需要依赖外部的服务器环境。\n2. **自动配置**：通过分析类路径和添加的依赖，Spring Boot 可以自动配置应用程序，减少手动配置的工作量。\n3. **起步依赖**：通过 Maven 或 Gradle 的起步依赖（starter dependencies），开发者可以快速添加所需的依赖项，而不需要手动配置。\n4. **简化开发**：Spring Boot 简化了 Spring 应用程序的开发流程，使得开发者可以更专注于业务逻辑，而不是配置和基础设施。\n5. **监控和管理**：Spring Boot 提供了 Actuator 模块，用于监控和管理应用程序的运行状态。\n\n### 使用场景：\n- **微服务开发**：Spring Boot 是构建微服务架构的理想选择，因为它支持独立部署和轻量级的配置。\n- **RESTful 服务**：Spring Boot 提供了强大的支持来构建 RESTful Web 服务。\n- **快速原型开发**：由于其快速的配置和启动时间，Spring Boot 适合快速原型开发和迭代。\n\n### 示例代码：\n```java\n@SpringBootApplication\npublic class DemoApplication {\n    public static void main(String[] args) {\n        SpringApplication.run(DemoApplication.class, args);\n    }\n}\n```\n\n这个简单的代码展示了如何使用 Spring Boot 创建一个基本的应用程序。通过 `@SpringBootApplication` 注解，Spring Boot 会自动配置应用程序，并启动嵌入式服务器。', '1', '2025-03-05 08:50:20');
INSERT INTO `ai_conversation` VALUES ('17', '{\"message\":\"我是一名沈阳职业学院研创工坊的学生，我现在处于就业和专升本的迷茫期，我的专业是全栈开发和鸿蒙开发，请给我一个合理的建议\\n\"}', '0', '2025-03-05 08:55:39');
INSERT INTO `ai_conversation` VALUES ('18', '<think>\n嗯，我现在是一名沈阳职业学院研创工坊的学生，专业是全栈开发和鸿蒙开发。最近我感到非常迷茫，不知道是选择就业还是专升本。我需要好好理清楚自己的想法，找到一个合理的建议。\n\n首先，我应该考虑自己的兴趣和职业目标。全栈开发和鸿蒙开发都是技术领域，我是否对这些技术充满热情呢？如果我对编程、解决问题和不断学习新技术有浓厚的兴趣，那么继续深造或者进入职场都会是不错的选择。但如果我对这些领域感到厌倦，可能需要重新考虑。\n\n接下来，我需要评估自己的职业规划。如果我打算长期从事IT行业，尤其是软件开发，那么专升本可能会让我在职业发展中更有竞争力。更高的学历可能在求职时给我更多的机会，尤其是在一些大公司或者需要高级职位的时候。然而，如果我更倾向于尽快进入职场，积累实际经验，那么就业可能更适合我。\n\n经济因素也是一个重要的考虑点。专升本需要时间和金钱的投入，我需要评估自己是否有足够的资源支持。如果家庭经济条件允许，或者我能通过助学金、奖学金减轻负担，那么继续学习可能是一个不错的选择。但如果经济压力大，就业可以让我在短时间内获得收入，缓解经济压力。\n\n然后，我应该考虑当前的就业市场。全栈开发和鸿蒙开发都是热门领域，就业机会相对较多。我可以先尝试实习，了解实际的工作环境和要求，看看自己是否适应。如果实习体验良好，就业可能会让我更快地进入职业轨道。同时，实习也能帮助我积累经验，提升自己的技能，这对将来的求职或升学会有帮助。\n\n关于专升本的选择，我需要了解哪些学校和专业适合我。选择一个有良好声誉的学校和相关专业，可以提升我的竞争力。同时，专升本的学习内容是否与我的兴趣和职业目标相符，也是需要考虑的因素。如果我选择专升本，如何平衡学习和工作也是一个问题，可能需要合理安排时间，确保两者都不受影响。\n\n我还需要思考自己的学习能力和时间管理能力。专升本需要投入大量的时间和精力，如果我能够高效地学习和管理时间，那么这将是一个不错的选择。但如果我担心自己无法坚持，可能需要先就业，积累经验后再考虑继续深造。\n\n另外，我应该考虑未来的晋升和发展空间。在职场中，学历可能是一个门槛，但实际能力和经验同样重要。如果我选择就业，可以通过不断学习和提升技能，获得晋升的机会。而专升本则可能为我打开更多的职业门路，尤其是在需要高级职位的时候。\n\n最后，我应该与身边的人交流，获取更多的建议。比如，向老师、学长学姐请教他们的经历和建议，或者参加职业规划讲座，了解更多关于就业和专升本的信息。同时，也可以尝试参加一些职业测评，了解自己的职业倾向和适合的工作类型，这有助于我做出更明智的决定。\n\n总的来说，我需要综合考虑自己的兴趣、职业目标、经济状况、就业市场、学习能力等因素，权衡利弊，做出最适合自己的选择。无论选择就业还是专升本，关键是要明确自己的目标，并为之努力。\n</think>\n\n根据您的情况，以下是综合考虑后的建议：\n\n1. **明确职业目标**：评估您对全栈开发和鸿蒙开发的热情，以及您希望在IT行业长期发展的意愿。\n\n2. **评估经济状况**：考虑家庭经济支持和个人财务状况，决定是否能够负担专升本的费用和时间投入。\n\n3. **实习和就业探索**：尝试相关领域的实习，了解工作环境和要求，积累实际经验，为就业或继续学习做准备。\n\n4. **选择专升本的学校和专业**：如果决定专升本，选择声誉良好、课程相关的学校，确保学习内容与职业目标一致。\n\n5. **平衡学习与工作**：如果选择就业后继续深造，合理安排时间，确保工作和学习两不误。\n\n6. **职业发展考量**：了解学历在职场中的作用，同时注重技能提升，为未来晋升和发展创造条件。\n\n7. **寻求他人建议**：与老师、学长学姐交流，获取更多职业规划的信息和建议。\n\n最终建议：如果您对技术充满热情，并希望在职业发展中具备更强的竞争力，专升本是一个不错的选择。同时，保持对技术的学习和实践，无论选择就业还是继续学习，都将帮助您在未来的职业道路上走得更远。', '1', '2025-03-05 08:56:06');
INSERT INTO `ai_conversation` VALUES ('54', '{\"message\":\"你是谁\\n\"}', '0', '2025-03-13 10:01:35');
INSERT INTO `ai_conversation` VALUES ('55', '<think>\n好，用户问“你是谁”，我需要回答清楚。首先，说明我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1。接着，简要介绍我的功能，比如信息查询、对话交流和问题解答。然后，表达愿意帮助用户的意愿，保持语气友好自然。最后，确保回答简洁明了，不使用任何Markdown格式，保持口语化。\n</think>\n\n您好！我是由中国的深度求索（DeepSeek）公司开发的智能助手DeepSeek-R1，很高兴为您提供服务！', '1', '2025-03-13 10:01:39');
INSERT INTO `ai_conversation` VALUES ('63', '{\"message\":\"你干嘛呢\\n\"}', '0', '2025-03-14 08:45:07');
INSERT INTO `ai_conversation` VALUES ('64', '<think>\nAlright, the user just said \"你干嘛呢\" which means \"What are you doing?\" in Chinese. I need to respond in a friendly and approachable way.\n\nI should let them know I\'m here to help and ask how I can assist them today. Keeping it simple and open-ended should encourage them to share what they need.\n</think>\n\n我正在等待您的指示，有什么我可以帮助您的吗？', '1', '2025-03-14 08:45:11');
INSERT INTO `ai_conversation` VALUES ('65', '{\"message\":\"给我取一个名字用于当做我的这个研创教学评价系统的ai助手\\n\"}', '0', '2025-03-17 10:34:06');
INSERT INTO `ai_conversation` VALUES ('66', '<think>\nOkay, so I need to come up with a name for an AI assistant that\'s part of a research and creation teaching evaluation system. Hmm, let\'s break this down. The system is for evaluating teaching, so maybe something that conveys evaluation, analysis, or support. It\'s also for research and creation, so perhaps something that suggests innovation or creativity.\n\nI should think about the purpose of the AI. It\'s supposed to help with evaluations, so maybe something that sounds intelligent and supportive. Words like \"Edu\" for education, \"Assist,\" \"Eval,\" \"Nova\" for new or innovation, \"Think,\" \"Genius,\" or \"Craft\" could be useful.\n\nLet me consider combining some of these. \"EduAssist\" sounds like it\'s helping with education. \"NovaEval\" combines newness with evaluation. \"TeachThink\" suggests thinking about teaching. \"InnoCraft\" implies innovative creation. \"EduNova\" combines education and new ideas. \"EvalGenius\" suggests smart evaluation. \"TeachCraft\" could mean crafting teaching methods. \"EduThink\" is about educational thinking.\n\nI should also think about the flow and how the name sounds. It should be easy to remember and pronounce. Maybe something short and catchy. \"EduAssist\" is straightforward, but maybe a bit generic. \"NovaEval\" sounds modern and techy. \"EvalGenius\" emphasizes intelligence. \"TeachCraft\" is nice but might not immediately convey evaluation.\n\nPerhaps combining education and evaluation aspects. \"EduNova\" is good because it combines education with something new. \"EvalCraft\" could work too, but it\'s not as catchy. \"InnoEval\" is another option, but maybe less so.\n\nI think \"EduNova\" is a strong contender. It\'s clear, combines education with innovation, and sounds positive. Alternatively, \"NovaEval\" is also good, emphasizing the newness of the evaluation system.\n\nWait, but the original assistant suggested names like \"EduAssist,\" \"NovaEval,\" etc. Maybe I should think of something more unique. Perhaps combining \"Research\" with something else. \"ResearchMate\" or \"InnoResearch.\" But the focus is on teaching evaluation, so maybe sticking with education terms is better.\n\nAnother angle is to think of the AI as a helper or guide. Words like \"Guide,\" \"Helper,\" or \"Mate.\" \"EduMate\" could be a possibility, but it\'s more about companionship than evaluation.\n\nAlternatively, focusing on the evaluation aspect: \"Eva\" is short for evaluation, so \"EvaAI\" or \"EvaAssist.\" But maybe too generic.\n\nI think the names suggested earlier are solid. Maybe \"EduNova\" or \"NovaEval\" are the best options. They are modern, convey the right message, and are easy to remember.\n</think>\n\n**Final Answer: EduNova**\n\n\"EduNova\" is chosen as the name for the AI assistant. It effectively combines education with innovation, conveying a modern and forward-thinking approach. The name is easy to remember, pronounce, and suggests a system that is both intelligent and supportive in the context of educational evaluation and research.', '1', '2025-03-17 10:34:25');
INSERT INTO `ai_conversation` VALUES ('67', '{\"message\":\"给我取一个名字用于当做我的这个研创教学评价系统的ai助手\\n中文名\\n\"}', '0', '2025-03-17 10:34:37');
INSERT INTO `ai_conversation` VALUES ('68', '<think>\n好的，我现在需要帮用户取一个中文名字，用于他们的研创教学评价系统的AI助手。首先，我得理解用户的需求。研创教学评价系统听起来是一个用于教育或学术领域的工具，可能用于评估学生的研究和创作成果。所以，这个名字应该专业且富有创意，同时要容易记住，听起来友好。\n\n用户希望是中文名字，所以我得考虑中文的音节和意义。可能需要结合“研创”、“教学”、“评价”这些关键词，或者传达出智能、协助的感觉。另外，名字要简洁，不要太长，这样用户在使用时会更方便。\n\n接下来，我会拆解这些关键词。“研”有研究的意思，“创”则是创造，结合起来代表创新和研究。教学评价系统可能需要传达出智慧、评估、帮助等概念。所以，名字中可以包含这些元素。\n\n考虑到AI助手通常给人的感觉是智能、友好，名字应该传达出这样的特质。比如，“智”字常用于表示智能，“助”则有帮助的意思。结合这些，我可以想到“智创助教”这样的名字，既包含了智能和创造，又突出了辅助教学的功能。\n\n另一个方向是考虑名字的流畅性和发音。比如，“知研”结合了知识和研究，“助教”直接点明了辅助教学的角色。这个名字简洁明了，容易记忆，也符合教育领域的氛围。\n\n再想，是否有更贴近“评价”这个功能的名字？比如“评创助手”，但这样可能显得不够专业，或者“智评助手”，但可能不够突出研究和创造的方面。\n\n综合考虑，我倾向于“智创助教”和“知研助手”这两个名字。前者强调智能和创造，后者则结合了知识和研究，同时都带有辅助教学的含义。这两个名字都简洁、易记，而且符合教育科技的氛围。\n\n最后，我会建议用户选择其中一个，或者根据他们的具体需求进一步调整。比如，如果他们更强调智能和创造，选择“智创助教”；如果更强调知识和研究，选择“知研助手”。\n</think>\n\n智创助教  \n知研助手  \n研创智助  \n学创帮手  \n智研助教  \n知创助手  \n研智助手  \n创研帮手', '1', '2025-03-17 10:34:51');
INSERT INTO `ai_conversation` VALUES ('71', '{\"message\":\"vue3与vue2区别\\n\"}', '0', '2025-03-18 18:20:36');
INSERT INTO `ai_conversation` VALUES ('72', '<think>\n嗯，用户问的是Vue3和Vue2的区别。我得先回忆一下这两个版本的主要变化。首先，Vue3的核心库体积变小了，性能也提升了，这可能是因为引入了新的特性，比如Proxy。然后是Composition API，这个是Vue3新增的，和Options API相比，更适合复杂逻辑的组件开发，可能更受开发者欢迎。\n\n接下来是响应式系统，Vue3用了Proxy，而Vue2用的是Object.defineProperty，Proxy在处理对象时更高效，特别是深层次的数据变化。还有Teleport，这个功能挺有用的，可以让组件内容渲染到其他地方，这对模态框或者侧边栏很有帮助。\n\nSuspense也是一个新特性，用于处理异步组件加载，显示loading状态，这在优化用户体验方面很重要。然后是Fragment，允许返回多个根节点，这样在某些情况下可以减少DOM结构，提升性能。\n\nAPI方面，Vue3简化了很多，比如createApp，setup函数，这些都让代码更简洁。还有全局API的变化，比如Vue.extend变成了defineComponent，这些变化可能需要开发者花点时间适应。\n\n生态系统方面，Vue3推荐使用Vite，而Vue2用的是Vue CLI，Vite在构建速度上更快。组件库方面，Element Plus和Vant都更新了对Vue3的支持，这对开发者来说是个好消息。\n\n编译器优化方面，Vue3做了很多改进，比如静态节点标记、代码分割优化，这些都能提升应用的性能。模板语法也更灵活，支持更多的JavaScript表达式，让开发更灵活。\n\n最后是兼容性，Vue3不支持IE，这可能对一些项目来说是个问题，但对大多数现代项目来说没问题。迁移方面，Vue团队提供了工具，帮助开发者从Vue2平滑过渡到Vue3。\n\n总的来说，Vue3在性能、API和新特性上都有很大提升，但迁移可能需要一些时间。我应该把这些点整理成一个清晰的结构，方便用户理解。\n</think>\n\nVue 3 和 Vue 2 之间的区别主要体现在核心库优化、新特性和API改进等方面。以下是详细的对比：\n\n---\n\n### 1. **核心库优化**\n- **体积更小**：Vue 3 的核心库体积比 Vue 2 小 40%。\n- **性能提升**：\n  - 响应式系统优化，渲染速度更快。\n  - 打包体积更小，依赖更少。\n\n---\n\n### 2. **新特性**\n#### (1) **Composition API**\n- Vue 3 引入了 Composition API，通过 `setup()` 函数将逻辑复用和代码组织变得更加灵活。\n- 优点：\n  - 更适合复杂逻辑的组件开发。\n  - 更清晰的代码结构，逻辑复用更方便。\n- 示例：\n  ```vue\n  <script setup>\n    import { ref } from \'vue\'\n    const count = ref(0)\n  </script>\n  ```\n\n#### (2) **Teleport**\n- 允许将组件的 DOM 结构渲染到应用中的其他位置。\n- 示例：\n  ```vue\n  <Teleport to=\"body\">\n    <div>渲染到 body 中的内容</div>\n  </Teleport>\n  ```\n\n#### (3) **Suspense**\n- 用于处理异步组件加载，提供加载中的 fallback 内容。\n- 示例：\n  ```vue\n  <Suspense>\n    <template #default>\n      <AsyncComponent />\n    </template>\n    <template #fallback>\n      <div>加载中...</div>\n    </template>\n  </Suspense>\n  ```\n\n#### (4) **Fragment**\n- 允许组件返回多个根节点，而无需包裹在一个容器中。\n- 示例：\n  ```vue\n  <template>\n    <fragment>\n      <div>第一个节点</div>\n      <div>第二个节点</div>\n    </fragment>\n  </template>\n  ```\n\n---\n\n### 3. **API 改进**\n#### (1) **响应式系统**\n- Vue 3 使用 `Proxy` 替代了 Vue 2 的 `Object.defineProperty`，性能更好，支持更多场景（如 `Map` 和 `Set`）。\n- 示例：\n  ```javascript\n  // Vue 3\n  const state = reactive({ count: 0 })\n  ```\n\n#### (2) **生命周期钩子**\n- 生命周期函数的命名规则改为 `onXXX`，例如 `onMounted` 替代 `mounted`。\n- 示例：\n  ```javascript\n  <script setup>\n    import { onMounted } from \'vue\'\n    onMounted(() => {\n      console.log(\'组件挂载\')\n    })\n  </script>\n  ```\n\n#### (3) **全局 API**\n- Vue 2 的 `Vue.extend` 替换为 Vue 3 的 `defineComponent`。\n- 示例：\n  ```javascript\n  // Vue 2\n  const MyComponent = Vue.extend({})\n  \n  // Vue 3\n  const MyComponent = defineComponent({})\n  ```\n\n---\n\n### 4. **生态系统**\n#### (1) **构建工具**\n- Vue 3 推荐使用 Vite 代替 Vue CLI，构建速度更快。\n- Vite 的特点：\n  - 基于原生 ES 模块。\n  - 开发服务器启动速度快。\n\n#### (2) **组件库**\n- 许多组件库（如 Element Plus、Vant）已支持 Vue 3。\n\n---\n\n### 5. **编译器优化**\n- Vue 3 的编译器对代码进行了更多优化，例如：\n  - 静态节点标记。\n  - 代码分割优化。\n- 模板语法更灵活，支持更多 JavaScript 表达式。\n\n---\n\n### 6. **兼容性**\n- Vue 3 不支持 IE 浏览器。\n- Vue 3 和 Vue 2 的兼容性较差，迁移需要一些调整。\n\n---\n\n### 7. **迁移工具**\n- Vue 团队提供了 `@vue/compiler-sfc` 和 `vue-composition-api` 等工具，帮助开发者从 Vue 2 平滑迁移至 Vue 3。\n\n---\n\n### 总结\nVue 3 在性能、API 和新特性上都有显著提升，但迁移成本较高。如果你的项目需要高性能、现代化的开发体验，建议升级到 Vue 3。', '1', '2025-03-18 18:21:15');
INSERT INTO `ai_conversation` VALUES ('73', '{\"message\":\"制作一个简单java图书管理\\n\"}', '0', '2025-03-18 18:24:41');
INSERT INTO `ai_conversation` VALUES ('74', '<think>\n嗯，用户想要制作一个简单的Java图书管理系统。首先，我得理解用户的需求。可能是一个学生或者刚学Java的人，想做一个练习项目。所以，系统需要简单，功能不需要太复杂，但要涵盖基本的 CRUD 操作。\n\n我应该先设计系统的基本结构。图书管理通常包括添加、删除、修改和查询书籍。所以，我需要创建一个Book类，包含书名、作者、ISBN和价格这些属性。然后，设计一个BookManager类来管理这些操作。\n\n接下来，考虑数据存储。为了简单，可以使用一个List来存储书籍，这样不需要涉及数据库，适合初学者。每个操作比如添加、删除、修改、查询，都可以通过遍历List来实现。\n\n然后，编写控制台界面。用户可以通过输入数字选择不同的操作，比如1是添加，2是删除，依此类推。这样用户交互比较直观，也容易实现。\n\n在实现每个功能时，要注意异常处理。比如删除或修改时，用户输入的ID是否存在，不存在的话要提示用户。另外，输入数据时，可能需要处理用户输入错误的情况，比如输入非数字，但为了简单，可能暂时不处理，或者在后续版本中添加。\n\n测试是重要的。在编写代码后，要测试每个功能是否正常工作。比如添加一本书后，查询是否能显示出来，删除后是否能移除，修改是否生效。\n\n最后，整理代码结构，确保代码清晰易懂，方便用户理解和修改。可能还需要添加一些注释，解释每个方法的作用，帮助用户更好地理解。\n\n总的来说，这个项目应该结构清晰，功能简单，适合学习和练习。完成后，用户可以根据需要扩展功能，比如添加借阅管理、用户管理等，但目前先满足基本需求。\n</think>\n\n好的，我将为您制作一个简单的Java图书管理系统。以下是系统的功能和代码实现：\n\n### 功能说明\n1. **添加书籍**：输入书名、作者、ISBN和价格，将书籍添加到系统中。\n2. **删除书籍**：通过输入书籍的ISBN来删除书籍。\n3. **修改书籍**：通过输入书籍的ISBN来修改书籍的信息。\n4. **查询书籍**：通过输入书籍的ISBN来查询书籍的信息。\n5. **显示所有书籍**：显示系统中所有书籍的信息。\n\n### 代码实现\n\n#### 1. Book类\n```java\npublic class Book {\n    private String bookName;\n    private String author;\n    private String isbn;\n    private double price;\n\n    public Book(String bookName, String author, String isbn, double price) {\n        this.bookName = bookName;\n        this.author = author;\n        this.isbn = isbn;\n        this.price = price;\n    }\n\n    // Getters and Setters\n    public String getBookName() {\n        return bookName;\n    }\n\n    public void setBookName(String bookName) {\n        this.bookName = bookName;\n    }\n\n    public String getAuthor() {\n        return author;\n    }\n\n    public void setAuthor(String author) {\n        this.author = author;\n    }\n\n    public String getIsbn() {\n        return isbn;\n    }\n\n    public void setIsbn(String isbn) {\n        this.isbn = isbn;\n    }\n\n    public double getPrice() {\n        return price;\n    }\n\n    public void setPrice(double price) {\n        this.price = price;\n    }\n\n    @Override\n    public String toString() {\n        return \"Book{\" +\n                \"书名=\'\" + bookName + \'\\\'\' +\n                \", 作者=\'\" + author + \'\\\'\' +\n                \", ISBN=\'\" + isbn + \'\\\'\' +\n                \", 价格=\" + price +\n                \'}\';\n    }\n}\n```\n\n#### 2. BookManager类\n```java\nimport java.util.ArrayList;\nimport java.util.List;\nimport java.util.Scanner;\n\npublic class BookManager {\n    private List<Book> bookList;\n    private Scanner scanner;\n\n    public BookManager() {\n        bookList = new ArrayList<>();\n        scanner = new Scanner(System.in);\n    }\n\n    public void addBook() {\n        System.out.println(\"请输入书名：\");\n        String bookName = scanner.nextLine();\n        System.out.println(\"请输入作者：\");\n        String author = scanner.nextLine();\n        System.out.println(\"请输入ISBN：\");\n        String isbn = scanner.nextLine();\n        System.out.println(\"请输入价格：\");\n        double price = scanner.nextDouble();\n        scanner.nextLine(); // 消耗换行符\n\n        Book book = new Book(bookName, author, isbn, price);\n        bookList.add(book);\n        System.out.println(\"书籍添加成功！\");\n    }\n\n    public void deleteBook() {\n        System.out.println(\"请输入要删除的书籍的ISBN：\");\n        String isbn = scanner.nextLine();\n\n        for (int i = 0; i < bookList.size(); i++) {\n            if (bookList.get(i).getIsbn().equals(isbn)) {\n                bookList.remove(i);\n                System.out.println(\"书籍删除成功！\");\n                return;\n            }\n        }\n        System.out.println(\"未找到该ISBN的书籍！\");\n    }\n\n    public void modifyBook() {\n        System.out.println(\"请输入要修改的书籍的ISBN：\");\n        String isbn = scanner.nextLine();\n\n        for (Book book : bookList) {\n            if (book.getIsbn().equals(isbn)) {\n                System.out.println(\"请输入新的书名：\");\n                book.setBookName(scanner.nextLine());\n                System.out.println(\"请输入新的作者：\");\n                book.setAuthor(scanner.nextLine());\n                System.out.println(\"请输入新的价格：\");\n                book.setPrice(scanner.nextDouble());\n                scanner.nextLine(); // 消耗换行符\n                System.out.println(\"书籍修改成功！\");\n                return;\n            }\n        }\n        System.out.println(\"未找到该ISBN的书籍！\");\n    }\n\n    public void queryBook() {\n        System.out.println(\"请输入要查询的书籍的ISBN：\");\n        String isbn = scanner.nextLine();\n\n        for (Book book : bookList) {\n            if (book.getIsbn().equals(isbn)) {\n                System.out.println(book);\n                return;\n            }\n        }\n        System.out.println(\"未找到该ISBN的书籍！\");\n    }\n\n    public void showAllBooks() {\n        System.out.println(\"系统中所有的书籍：\");\n        for (Book book : bookList) {\n            System.out.println(book);\n        }\n    }\n\n    public void closeScanner() {\n        scanner.close();\n    }\n}\n```\n\n#### 3. 主程序\n```java\npublic class Main {\n    public static void main(String[] args) {\n        BookManager manager = new BookManager();\n        Scanner scanner = new Scanner(System.in);\n        boolean exit = false;\n\n        while (!exit) {\n            System.out.println(\"\\n图书管理系统\");\n            System.out.println(\"1. 添加书籍\");\n            System.out.println(\"2. 删除书籍\");\n            System.out.println(\"3. 修改书籍\");\n            System.out.println(\"4. 查询书籍\");\n            System.out.println(\"5. 显示所有书籍\");\n            System.out.println(\"6. 退出系统\");\n            System.out.println(\"请输入操作编号：\");\n\n            int choice = scanner.nextInt();\n            scanner.nextLine(); // 消耗换行符\n\n            switch (choice) {\n                case 1:\n                    manager.addBook();\n                    break;\n                case 2:\n                    manager.deleteBook();\n                    break;\n                case 3:\n                    manager.modifyBook();\n                    break;\n                case 4:\n                    manager.queryBook();\n                    break;\n                case 5:\n                    manager.showAllBooks();\n                    break;\n                case 6:\n                    exit = true;\n                    System.out.println(\"退出系统，再见！\");\n                    break;\n                default:\n                    System.out.println(\"输入有误，请重新输入！\");\n            }\n        }\n\n        manager.closeScanner();\n    }\n}\n```\n\n### 使用说明\n1. 运行程序后，您将看到一个菜单，可以选择不同的操作。\n2. 每个操作都会提示您输入相应的信息。\n3. 输入完成后，按回车键确认。\n4. 输入6可以退出系统。\n\n### 功能示例\n- 添加书籍：\n  ```\n  请输入书名：\n  Java编程思想\n  请输入作者：\n  �Bruce Eckel\n  请输入ISBN：\n  978-7-121-30325-3\n  请输入价格：\n  89.0\n  书籍添加成功！\n  ```\n\n- 查询书籍：\n  ```\n  请输入要查询的书籍的ISBN：\n  978-7-121-30325-3\n  Book{书名=\'Java编程思想\', 作者=\'Bruce Eckel\', ISBN=\'978-7-121-30325-3\', 价格=89.0}\n  ```\n\n- 显示所有书籍：\n  ```\n  系统中所有的书籍：\n  Book{书名=\'Java编程思想\', 作者=\'Bruce Eckel\', ISBN=\'978-7-121-30325-3\', 价格=89.0}\n  ```\n\n希望这个简单的图书管理系统对您有所帮助！如果有任何问题或需要扩展功能，请随时告诉我！', '1', '2025-03-18 18:25:41');
INSERT INTO `ai_conversation` VALUES ('75', '{\"message\":\"什么是vue\\n\"}', '0', '2025-03-21 08:47:06');
INSERT INTO `ai_conversation` VALUES ('76', '<think>\nOkay, I need to explain what Vue.js is. Let me start by saying it\'s a JavaScript framework used for building user interfaces, especially single-page applications.\n\nI should mention that it\'s open-source and maintained by Evan You and the community. It\'s known for being lightweight and flexible.\n\nI\'ll highlight its key features like reactivity, components, and directives. Reactivity is a big one because it makes data-binding easy.\n\nComponents allow developers to create reusable UI elements, which helps in managing large applications. Directives add functionality to DOM elements, making the code cleaner.\n\nI should also talk about its ecosystem, like Vue Router for navigation and Vuex for state management. These tools make Vue powerful for complex projects.\n\nComparing it briefly to other frameworks like React and Angular could help users understand where Vue stands. It\'s often seen as easier to learn and has a more approachable syntax.\n\nFinally, I\'ll wrap it up by emphasizing that Vue is a great choice for both small and large projects, thanks to its flexibility and growing community support.\n</think>\n\nVue.js 是一个用于构建用户界面的渐进式 JavaScript 框架，特别适用于单页应用程序（SPA）。它由 Evan You 于 2014 年创建，并迅速成为前端开发领域最受欢迎的框架之一。Vue.js 的核心目标是通过尽可能简单的 API 提供响应的数据绑定和组件化开发。\n\n### Vue.js 的主要特点：\n1. **响应式数据绑定**：Vue.js 的核心是一个响应式系统，它能够自动追踪数据变化并更新视图。开发者可以通过简单的声明式语法将数据与 DOM 绑定，实现数据驱动的视图更新。\n   \n2. **组件化开发**：Vue.js 提倡组件化开发，允许开发者将复杂的 UI 分解为可重用的组件。每个组件都有自己的模板、逻辑和样式，这使得代码结构更清晰，维护更方便。\n\n3. **虚拟 DOM**：Vue.js 使用虚拟 DOM 来优化渲染性能。通过比较虚拟 DOM 的差异，Vue 只会更新实际变化的部分，从而减少对 DOM 的操作，提高应用的运行效率。\n\n4. **生态系统丰富**：Vue.js 拥有丰富的生态系统，包括 Vue Router（用于路由管理）、Vuex（用于状态管理）、Vue CLI（用于快速搭建开发环境）等工具，能够满足各种开发需求。\n\n5. **轻量级**：Vue.js 的核心库非常轻量，仅包含构建现代 Web 应用所需的功能，同时允许开发者根据需要选择扩展。\n\n6. **灵活性**：Vue.js 是一个渐进式框架，开发者可以根据项目需求逐步引入其功能，而不需要一次性采用整个框架。这种灵活性使得 Vue.js 适用于从小型项目到大型复杂应用的各种场景。\n\n### Vue.js 的优势：\n- **学习曲线低**：Vue.js 的 API 相对简单，文档完善，对于新手来说容易上手。\n- **高效的更新机制**：虚拟 DOM 和智能更新机制使得 Vue.js 在处理大规模数据和复杂 UI 时表现优异。\n- **活跃的社区**：Vue.js 拥有一个活跃的开源社区，不断贡献新的功能和插件，保持框架的活力和创新。\n\n### 应用场景：\n- **单页应用（SPA）**：Vue.js 非常适合构建 SPA，因为它能够通过前端路由实现快速的页面切换和动态内容加载。\n- **移动端开发**：Vue.js 可以与框架如 Vue Native 结合，用于跨平台的移动端开发。\n- **桌面应用**：通过 Electron 等工具，Vue.js 也可以用于构建桌面应用程序。\n\n总的来说，Vue.js 是一个强大而灵活的框架，能够帮助开发者高效地构建现代 Web 应用程序。', '1', '2025-03-21 08:47:30');
INSERT INTO `ai_conversation` VALUES ('77', '{\"message\":\"你好\\n\"}', '0', '2025-03-24 12:59:29');
INSERT INTO `ai_conversation` VALUES ('78', '<think>\nAlright, the user greeted me with \"你好\" which means \"hello\" in Chinese. I should respond politely in the same language to keep the conversation flowing smoothly. I\'ll say \"你好！有什么我可以帮助你的吗？\" which means \"Hello! How can I assist you?\" That should cover it.\n</think>\n\n你好！有什么我可以帮助你的吗？', '1', '2025-03-24 12:59:32');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `cover_path` varchar(255) DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `level` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('41', 'vue', '/api/file/covers/a1e5321c-12f7-4c74-b786-ecc2e7acc6a8_8ba4c306a402462e2f01aee14b7471c.jpg', '0', null);

-- ----------------------------
-- Table structure for `course_resource`
-- ----------------------------
DROP TABLE IF EXISTS `course_resource`;
CREATE TABLE `course_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `original_name` varchar(255) DEFAULT NULL,
  `storage_path` varchar(255) DEFAULT NULL,
  `unit_id` bigint DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlnttybc700wdt9mqgo3icn20d` (`unit_id`),
  CONSTRAINT `FKlnttybc700wdt9mqgo3icn20d` FOREIGN KEY (`unit_id`) REFERENCES `course_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course_resource
-- ----------------------------
INSERT INTO `course_resource` VALUES ('62', '3.2.2 Vue的指令_电子教案.docx', 'api/file/materials/223aa78d-b6b2-45d3-b535-c652f76b9288_3.2.2 Vue的指令_电子教案.docx', '84', null);

-- ----------------------------
-- Table structure for `course_unit`
-- ----------------------------
DROP TABLE IF EXISTS `course_unit`;
CREATE TABLE `course_unit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `order_num` int DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqx9j2vqcpjecnjw9rgv5x0byl` (`course_id`),
  CONSTRAINT `FKqx9j2vqcpjecnjw9rgv5x0byl` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course_unit
-- ----------------------------
INSERT INTO `course_unit` VALUES ('84', '单元 1', null, '41');

-- ----------------------------
-- Table structure for `t_exam_paper`
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper`;
CREATE TABLE `t_exam_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `paper_type` int DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `suggest_time` int DEFAULT NULL,
  `limit_start_time` datetime DEFAULT NULL,
  `limit_end_time` datetime DEFAULT NULL,
  `frame_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `task_exam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
INSERT INTO `t_exam_paper` VALUES ('15', 'Vue基础知识点练习', '10', '1', '1', '220', '5', '30', null, null, '24', '2', '2025-03-12 16:02:34', '', null);

-- ----------------------------
-- Table structure for `t_exam_paper_answer`
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_answer`;
CREATE TABLE `t_exam_paper_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_paper_id` int DEFAULT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paper_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `system_score` int DEFAULT NULL,
  `user_score` int DEFAULT NULL,
  `paper_score` int DEFAULT NULL,
  `question_correct` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `do_time` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `task_exam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper_answer
-- ----------------------------
INSERT INTO `t_exam_paper_answer` VALUES ('24', '15', 'Vue基础知识点练习', '1', '10', '90', '90', '220', '3', '5', '34', '2', '6', '2025-03-12 16:03:28', null);

-- ----------------------------
-- Table structure for `t_exam_paper_question_customer_answer`
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_question_customer_answer`;
CREATE TABLE `t_exam_paper_question_customer_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `exam_paper_id` int DEFAULT NULL,
  `exam_paper_answer_id` int DEFAULT NULL,
  `question_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `customer_score` int DEFAULT NULL,
  `question_score` int DEFAULT NULL,
  `question_text_content_id` int DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_content_id` int DEFAULT NULL,
  `do_right` bit(1) DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper_question_customer_answer
-- ----------------------------
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('41', '4', '15', '24', '1', '10', '20', '20', '19', 'B', null, '', '6', '2025-03-12 16:03:28', '1');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('42', '5', '15', '24', '2', '10', '50', '50', '20', 'A,B,C,D', null, '', '6', '2025-03-12 16:03:28', '2');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('43', '6', '15', '24', '3', '10', '20', '20', '21', 'B', null, '', '6', '2025-03-12 16:03:28', '3');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('44', '7', '15', '24', '4', '10', '0', '30', '22', null, '25', '', '6', '2025-03-12 16:03:28', '4');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('45', '8', '15', '24', '5', '10', '0', '100', '23', null, '26', '', '6', '2025-03-12 16:03:28', '5');

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `send_user_id` int DEFAULT NULL,
  `send_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `send_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive_user_count` int DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('3', '学习进度', '请完成考试', '2024-12-23 15:25:47', '2', 'admin', '李老师', '1', '0');
INSERT INTO `t_message` VALUES ('4', '考试', '请完成考试内容', '2024-12-24 08:57:55', '2', 'admin', '李老师', '1', '1');
INSERT INTO `t_message` VALUES ('5', '考试', '请准备考试', '2024-12-24 09:02:00', '2', 'admin', '李老师', '1', '1');

-- ----------------------------
-- Table structure for `t_message_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_message_user`;
CREATE TABLE `t_message_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int DEFAULT NULL,
  `receive_user_id` int DEFAULT NULL,
  `receive_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `readed` bit(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message_user
-- ----------------------------
INSERT INTO `t_message_user` VALUES ('1', '1', '3', 'yingying', '金莹海', '', '2024-11-30 18:13:40', '2024-11-30 18:13:55');
INSERT INTO `t_message_user` VALUES ('2', '2', '1', 'student', '学生', '', '2024-12-02 09:37:41', '2024-12-02 09:37:51');
INSERT INTO `t_message_user` VALUES ('3', '3', '7', '123456', '张三', '', '2024-12-23 15:25:47', null);
INSERT INTO `t_message_user` VALUES ('4', '4', '6', '202313050134', '刘文祥', '', '2024-12-24 08:57:55', '2024-12-24 09:00:53');
INSERT INTO `t_message_user` VALUES ('5', '5', '6', '202313050134', '刘文祥', '', '2024-12-24 09:02:00', '2024-12-24 09:03:29');

-- ----------------------------
-- Table structure for `t_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `difficult` int DEFAULT NULL,
  `correct` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `info_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('4', '1', '10', '20', '1', '1', 'B', '19', '2', '1', '2025-03-12 15:54:58', '');
INSERT INTO `t_question` VALUES ('5', '2', '10', '50', '1', '3', 'A,B,C,D', '20', '2', '1', '2025-03-12 15:56:28', '');
INSERT INTO `t_question` VALUES ('6', '3', '10', '20', '1', '2', 'B', '21', '2', '1', '2025-03-12 15:57:55', '');
INSERT INTO `t_question` VALUES ('7', '4', '10', '30', '1', '3', '', '22', '2', '1', '2025-03-12 15:59:22', '');
INSERT INTO `t_question` VALUES ('8', '5', '10', '100', '1', '2', '<p>v-if是真正的条件渲染，元素不存在于DOM</p><p>v-show通过CSS的display属性控制显示</p><p>v-if有更高的切换开销，v-show有更高的初始渲染开销</p><p class=\"ueditor-p\"><br/></p>', '23', '2', '1', '2025-03-12 16:00:19', '');

-- ----------------------------
-- Table structure for `t_subject`
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES ('3', '数据结构与算法', '1', '软件技术', null, '');
INSERT INTO `t_subject` VALUES ('4', 'Web开发', '1', '软件技术', null, '');
INSERT INTO `t_subject` VALUES ('5', '移动应用开发', '1', '软件技术', null, '');
INSERT INTO `t_subject` VALUES ('6', 'JavaScript+jQuery', '1', '软件技术', null, '');
INSERT INTO `t_subject` VALUES ('7', '程序设计基础', '1', '软件技术', null, '');
INSERT INTO `t_subject` VALUES ('8', '数据库系统', '4', '人工智能', null, '');
INSERT INTO `t_subject` VALUES ('9', '大数据', '2', '大数据技术', null, '');
INSERT INTO `t_subject` VALUES ('10', 'Vue', '1', '软件技术', null, '');

-- ----------------------------
-- Table structure for `t_task_exam`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam`;
CREATE TABLE `t_task_exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `frame_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_task_exam
-- ----------------------------

-- ----------------------------
-- Table structure for `t_task_exam_customer_answer`
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam_customer_answer`;
CREATE TABLE `t_task_exam_customer_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_exam_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `text_content_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_task_exam_customer_answer
-- ----------------------------

-- ----------------------------
-- Table structure for `t_text_content`
-- ----------------------------
DROP TABLE IF EXISTS `t_text_content`;
CREATE TABLE `t_text_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
INSERT INTO `t_text_content` VALUES ('19', '{\"titleContent\":\"在Vue中，下列哪个指令用于条件渲染？\",\"analyze\":\"v-if是真正的条件渲染指令，而v-show只是切换CSS的display属性\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"v-show\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"v-if\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"v-for\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"v-bind\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2025-03-12 15:54:58');
INSERT INTO `t_text_content` VALUES ('20', '{\"titleContent\":\"以下哪些是Vue组件通信的正确方式？\",\"analyze\":\"所有选项均为Vue组件通信的有效方式\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"Props\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"Event Bus\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"Vuex\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"$refs\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2025-03-12 15:56:28');
INSERT INTO `t_text_content` VALUES ('21', '{\"titleContent\":\"Vue3的Composition API可以完全替代Options API\",\"analyze\":\"Composition API是补充而非替代，开发者可以根据需求选择\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"正确\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"错误\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2025-03-12 15:57:55');
INSERT INTO `t_text_content` VALUES ('22', '{\"titleContent\":\"Vue3的响应式系统核心是通过<span class=\\\"gapfilling-span a375151f-e46a-4ffe-95ba-03c06dc7ed8a\\\">1</span>方法实现的\",\"analyze\":\"Vue2使用Object.defineProperty，Vue3改用Proxy\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"Proxy\",\"score\":30,\"itemUuid\":\"a375151f-e46a-4ffe-95ba-03c06dc7ed8a\"}],\"correct\":\"\"}', '2025-03-12 15:59:22');
INSERT INTO `t_text_content` VALUES ('23', '{\"titleContent\":\"请简述v-if和v-show的主要区别\",\"analyze\":\"<p>v-if是真正的条件渲染，元素不存在于DOM</p><p>v-show通过CSS的display属性控制显示</p><p>v-if有更高的切换开销，v-show有更高的初始渲染开销</p>\",\"questionItemObjects\":[],\"correct\":\"<p>v-if是真正的条件渲染，元素不存在于DOM</p><p>v-show通过CSS的display属性控制显示</p><p>v-if有更高的切换开销，v-show有更高的初始渲染开销</p><p class=\\\"ueditor-p\\\"><br/></p>\"}', '2025-03-12 16:00:19');
INSERT INTO `t_text_content` VALUES ('24', '[{\"name\":\"单选题\",\"questionItems\":[{\"id\":4,\"itemOrder\":1}]},{\"name\":\"多选题\",\"questionItems\":[{\"id\":5,\"itemOrder\":2}]},{\"name\":\"判断题\",\"questionItems\":[{\"id\":6,\"itemOrder\":3}]},{\"name\":\"填空题\",\"questionItems\":[{\"id\":7,\"itemOrder\":4}]},{\"name\":\"简答题\",\"questionItems\":[{\"id\":8,\"itemOrder\":5}]}]', '2025-03-12 16:02:34');
INSERT INTO `t_text_content` VALUES ('25', '[\"Proxy\"]', '2025-03-12 16:03:28');
INSERT INTO `t_text_content` VALUES ('26', 'v-if有更高的切换开销，v-show有更高的初始渲染开销', '2025-03-12 16:03:28');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `birth_day` datetime DEFAULT NULL,
  `user_level` int DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `last_active_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'd2d29da2-dcb3-4013-b874-727626236f47', '刘新宇', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '学生', '18', '2', '2019-09-01 00:00:00', '1', '19171171610', '1', '1', 'http://snngl141b.hn-bkt.clouddn.com/FtzOStXx4to_EjnUxyCmkN0gBhjl', '2019-09-07 18:55:02', '2024-12-12 15:18:20', null, '', 'oeIHv6wR7OI7bl4DlUq3nIzdn-Tk');
INSERT INTO `t_user` VALUES ('2', '52045f5f-a13f-4ccc-93dd-f7ee8270ad4c', 'admin', 'CHG2kTu2ZxlUfvHm3jLtqMbAKvXRcCTgjsyXOuhQMGf8a5577//Tt1SVzehTP6m6gnNNouX2IobJVssJMJESZfBB5D8B2QxSDbTvhyVpyzSWdBgqdfgmfJYP9wOWEdogiTJahgiAGbP1lVr+VnGG2EdRzFjKG7az5/tiaFfVqD8=', '李老师', '30', '2', '2000-09-07 00:00:00', null, '18888888888', '3', '1', null, '2019-09-07 18:56:21', '2024-12-18 13:59:48', null, '', null);
INSERT INTO `t_user` VALUES ('3', '3eecc304-68e2-465f-b624-972d8863e5c8', '202314215001', 'FZJb5zMJe3lAPuyONh0HPc7wOePJr0TvGz5Jg+6TLAX5O5mE8zwE6cxG//4Huja3WAXN0B/OSQhR49AOsds1IXC6zZdYCmvqsa+1NWppfopAOynCS69A0cE2uNLeFYr0r2lxClPos0jDBwZtpZUrUjSfKrnvX2v9ObIukznyKx4=', '金莹海', '18', '2', '2005-03-18 00:00:00', '8', '13222222222', '1', '1', 'http://snngl141b.hn-bkt.clouddn.com/Fn0HUj-Glysq2R3nlYwqzdKpUftZ', '2024-11-30 17:58:36', '2025-03-20 08:12:49', '2024-11-30 17:58:36', '', null);
INSERT INTO `t_user` VALUES ('4', '821292ab-ddb8-4843-8e02-30fa685b2f1b', 'teacher2', 'aJstmbgnsSDZZkorpR3tAeRAFcduYdmMYHzzyoJjJnPrjsYPjmUDX8HBtmhqubB2Nm4sfPWoQD07Vwmt1fsx56Ofa43MmYmKS5pZ2NEoNZs8w9dlUet454GLql+Oq+IkbOVTEEWGg1eBhf1YlOjrXfvcOrFIpL2yy0H6bJpT97s=', '张老师', '35', '1', '2004-12-04 00:00:00', null, '15656565656', '3', '1', null, '2024-11-30 18:01:36', '2024-12-18 14:00:42', '2024-11-30 18:01:36', '', null);
INSERT INTO `t_user` VALUES ('5', '887ce558-3ae0-4fbf-beb1-0dbd4a6bafda', '202315477412', 'MR6RBLNf1r+sPu2VTdvmd70jjvlh75bNTUhicSUKCgPn+0XO2Pm6/Kuu75LZLNOGspsYgSOb3QFwMM6c7aJFm1e470FRFHhVzxfwz7dD9vojuEe5nXylr6DyPehkWE1J1XkQgcCucq90ZVxRKyKNlyqnW88zYHOlMAAbSfgWg44=', '张晓明', '16', '1', '2004-07-23 00:00:00', '5', '18222222222', '1', '1', null, '2024-12-13 13:48:30', '2024-12-18 13:16:12', '2024-12-13 13:48:30', '', null);
INSERT INTO `t_user` VALUES ('6', '128310d9-599b-48d1-b749-490645cbde62', '202313050134', 'lh3PinUkQpKE7xsBbnuFs4hy5+H/WaSXK0vR+tGTanEDBP90ofT56EnTJZrFqlhMKjyN6TLyWaSn2HFEH+DN/vRq0OYkOR78kF9ywUUILaktK3BkvEAZUImY9Is+BBZfNkj2xj+IjSe8u7kvdIlAgYpxnS9sCh7lUp18fXbKWPY=', '刘文祥', '19', '1', '2005-12-02 00:00:00', '1', '19888888888', '1', '1', null, '2024-12-16 13:15:40', '2024-12-27 08:15:49', '2024-12-16 13:15:40', '', null);
INSERT INTO `t_user` VALUES ('7', '4cba1dc9-22dc-4bc4-bb34-2dcf06e4b8d4', '123456', 'acLUS16TWl2kzz98JsgKRpWaDpPhMt44sD/F2zpFsu2/tQb0V63viOx8bEdgiXhJA5ADQW5/ZYDzvte2QzRGuJP8wXHgeRJB0VTITCiz7bXHFN6sT4wN5k7aGB2AGHLFFCXQImn32hr5z5l5gQwVhQvKCWEv0CWNq7wJu8eu4SE=', '张三', null, '2', null, '1', '156464646464', '1', '1', null, '2024-12-23 10:25:15', '2025-03-18 17:59:33', '2024-12-23 10:25:15', '', null);

-- ----------------------------
-- Table structure for `t_user_event_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_event_log`;
CREATE TABLE `t_user_event_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_event_log
-- ----------------------------
INSERT INTO `t_user_event_log` VALUES ('354', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-12 15:48:42');
INSERT INTO `t_user_event_log` VALUES ('355', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-12 16:02:50');
INSERT INTO `t_user_event_log` VALUES ('356', '6', '202313050134', '刘文祥', '202313050134 提交试卷：Vue基础知识点练习 得分：9 耗时：34 秒', '2025-03-12 16:03:28');
INSERT INTO `t_user_event_log` VALUES ('357', '6', '202313050134', '刘文祥', '202313050134 批改试卷：Vue基础知识点练习 得分：9', '2025-03-12 16:03:42');
INSERT INTO `t_user_event_log` VALUES ('358', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-12 16:03:51');
INSERT INTO `t_user_event_log` VALUES ('359', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-12 16:06:27');
INSERT INTO `t_user_event_log` VALUES ('360', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-13 08:19:53');
INSERT INTO `t_user_event_log` VALUES ('361', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-13 08:38:46');
INSERT INTO `t_user_event_log` VALUES ('362', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-13 09:47:40');
INSERT INTO `t_user_event_log` VALUES ('363', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-13 13:09:06');
INSERT INTO `t_user_event_log` VALUES ('364', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-13 19:31:17');
INSERT INTO `t_user_event_log` VALUES ('365', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-14 08:16:38');
INSERT INTO `t_user_event_log` VALUES ('366', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-14 08:31:19');
INSERT INTO `t_user_event_log` VALUES ('367', '6', '202313050134', '刘文祥', '202313050134 登出了研创教学评价系统', '2025-03-14 10:22:42');
INSERT INTO `t_user_event_log` VALUES ('368', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-14 10:24:06');
INSERT INTO `t_user_event_log` VALUES ('369', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-14 10:24:08');
INSERT INTO `t_user_event_log` VALUES ('370', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-14 13:03:47');
INSERT INTO `t_user_event_log` VALUES ('371', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-14 13:15:52');
INSERT INTO `t_user_event_log` VALUES ('372', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-14 13:51:00');
INSERT INTO `t_user_event_log` VALUES ('373', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 09:55:23');
INSERT INTO `t_user_event_log` VALUES ('374', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 09:55:25');
INSERT INTO `t_user_event_log` VALUES ('375', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 09:55:28');
INSERT INTO `t_user_event_log` VALUES ('376', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 09:55:29');
INSERT INTO `t_user_event_log` VALUES ('377', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 09:58:39');
INSERT INTO `t_user_event_log` VALUES ('378', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 09:58:42');
INSERT INTO `t_user_event_log` VALUES ('379', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 09:58:44');
INSERT INTO `t_user_event_log` VALUES ('380', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 09:59:15');
INSERT INTO `t_user_event_log` VALUES ('381', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 10:00:30');
INSERT INTO `t_user_event_log` VALUES ('382', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 10:00:44');
INSERT INTO `t_user_event_log` VALUES ('383', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 10:03:04');
INSERT INTO `t_user_event_log` VALUES ('384', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-17 10:19:10');
INSERT INTO `t_user_event_log` VALUES ('385', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 10:20:41');
INSERT INTO `t_user_event_log` VALUES ('386', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 15:09:52');
INSERT INTO `t_user_event_log` VALUES ('387', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 15:50:56');
INSERT INTO `t_user_event_log` VALUES ('388', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-17 16:30:02');
INSERT INTO `t_user_event_log` VALUES ('389', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 08:06:10');
INSERT INTO `t_user_event_log` VALUES ('390', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 08:46:32');
INSERT INTO `t_user_event_log` VALUES ('391', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 10:33:36');
INSERT INTO `t_user_event_log` VALUES ('392', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 10:57:37');
INSERT INTO `t_user_event_log` VALUES ('393', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 17:05:51');
INSERT INTO `t_user_event_log` VALUES ('394', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 17:08:27');
INSERT INTO `t_user_event_log` VALUES ('395', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-18 17:09:47');
INSERT INTO `t_user_event_log` VALUES ('396', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-18 17:42:34');
INSERT INTO `t_user_event_log` VALUES ('397', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 18:06:06');
INSERT INTO `t_user_event_log` VALUES ('398', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-18 18:25:15');
INSERT INTO `t_user_event_log` VALUES ('399', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 18:26:01');
INSERT INTO `t_user_event_log` VALUES ('400', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-18 18:36:40');
INSERT INTO `t_user_event_log` VALUES ('401', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 19:09:32');
INSERT INTO `t_user_event_log` VALUES ('402', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-18 19:17:43');
INSERT INTO `t_user_event_log` VALUES ('403', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 19:27:35');
INSERT INTO `t_user_event_log` VALUES ('404', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-18 20:04:40');
INSERT INTO `t_user_event_log` VALUES ('405', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-19 08:05:26');
INSERT INTO `t_user_event_log` VALUES ('406', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-19 13:45:42');
INSERT INTO `t_user_event_log` VALUES ('407', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-19 14:24:52');
INSERT INTO `t_user_event_log` VALUES ('408', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-19 14:50:41');
INSERT INTO `t_user_event_log` VALUES ('409', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-19 14:58:06');
INSERT INTO `t_user_event_log` VALUES ('410', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-19 15:00:20');
INSERT INTO `t_user_event_log` VALUES ('411', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-19 15:46:53');
INSERT INTO `t_user_event_log` VALUES ('412', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-19 15:51:19');
INSERT INTO `t_user_event_log` VALUES ('413', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-19 16:30:01');
INSERT INTO `t_user_event_log` VALUES ('414', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-19 16:30:12');
INSERT INTO `t_user_event_log` VALUES ('415', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 08:07:49');
INSERT INTO `t_user_event_log` VALUES ('416', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-20 08:12:08');
INSERT INTO `t_user_event_log` VALUES ('417', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 08:22:32');
INSERT INTO `t_user_event_log` VALUES ('418', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-20 08:31:06');
INSERT INTO `t_user_event_log` VALUES ('419', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 08:33:58');
INSERT INTO `t_user_event_log` VALUES ('420', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-20 08:34:17');
INSERT INTO `t_user_event_log` VALUES ('421', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 08:40:03');
INSERT INTO `t_user_event_log` VALUES ('422', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-20 09:09:49');
INSERT INTO `t_user_event_log` VALUES ('423', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 09:16:28');
INSERT INTO `t_user_event_log` VALUES ('424', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 10:13:47');
INSERT INTO `t_user_event_log` VALUES ('425', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 10:22:33');
INSERT INTO `t_user_event_log` VALUES ('426', '6', '202313050134', '刘文祥', '202313050134 登出了研创教学评价系统', '2025-03-20 10:24:43');
INSERT INTO `t_user_event_log` VALUES ('427', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 10:24:46');
INSERT INTO `t_user_event_log` VALUES ('428', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 10:59:57');
INSERT INTO `t_user_event_log` VALUES ('429', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 11:04:09');
INSERT INTO `t_user_event_log` VALUES ('430', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 11:06:20');
INSERT INTO `t_user_event_log` VALUES ('431', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-20 11:06:23');
INSERT INTO `t_user_event_log` VALUES ('432', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 11:06:48');
INSERT INTO `t_user_event_log` VALUES ('433', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 11:30:51');
INSERT INTO `t_user_event_log` VALUES ('434', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 12:58:40');
INSERT INTO `t_user_event_log` VALUES ('435', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 13:11:28');
INSERT INTO `t_user_event_log` VALUES ('436', '6', '202313050134', '刘文祥', '202313050134 登出了研创教学评价系统', '2025-03-20 13:11:40');
INSERT INTO `t_user_event_log` VALUES ('437', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-20 13:59:28');
INSERT INTO `t_user_event_log` VALUES ('438', '6', '202313050134', '刘文祥', '202313050134 登出了研创教学评价系统', '2025-03-20 13:59:37');
INSERT INTO `t_user_event_log` VALUES ('439', '7', '123456', '张三', '123456 登录了研创教学评价系统', '2025-03-20 13:59:42');
INSERT INTO `t_user_event_log` VALUES ('440', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-20 18:26:12');
INSERT INTO `t_user_event_log` VALUES ('441', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-21 08:14:51');
INSERT INTO `t_user_event_log` VALUES ('442', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-21 08:37:33');
INSERT INTO `t_user_event_log` VALUES ('443', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-21 09:11:14');
INSERT INTO `t_user_event_log` VALUES ('444', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-21 11:22:29');
INSERT INTO `t_user_event_log` VALUES ('445', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-21 11:29:27');
INSERT INTO `t_user_event_log` VALUES ('446', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-21 13:24:57');
INSERT INTO `t_user_event_log` VALUES ('447', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-21 14:14:43');
INSERT INTO `t_user_event_log` VALUES ('448', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-21 15:02:03');
INSERT INTO `t_user_event_log` VALUES ('449', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-21 15:02:06');
INSERT INTO `t_user_event_log` VALUES ('450', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-24 08:25:31');
INSERT INTO `t_user_event_log` VALUES ('451', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-24 08:26:41');
INSERT INTO `t_user_event_log` VALUES ('452', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-24 09:57:01');
INSERT INTO `t_user_event_log` VALUES ('453', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-24 10:02:19');
INSERT INTO `t_user_event_log` VALUES ('454', '2', 'admin', '李老师', 'admin 登录了研创教学评价系统', '2025-03-24 10:07:04');
INSERT INTO `t_user_event_log` VALUES ('455', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-24 10:55:12');
INSERT INTO `t_user_event_log` VALUES ('456', '6', '202313050134', '刘文祥', '202313050134 登录了研创教学评价系统', '2025-03-24 10:56:33');

-- ----------------------------
-- Table structure for `t_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_token`;
CREATE TABLE `t_user_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_token
-- ----------------------------
INSERT INTO `t_user_token` VALUES ('1', '8f4b3f27-25f7-4520-8fe4-ede04ea8f1ef', '1', 'oeIHv6wR7OI7bl4DlUq3nIzdn-Tk', '2024-11-28 16:27:30', '2024-11-29 04:27:30', 'student');
INSERT INTO `t_user_token` VALUES ('3', 'c2dd7d7a-8034-48ca-bba8-e6f86a054737', '1', 'oeIHv6wR7OI7bl4DlUq3nIzdn-Tk', '2024-11-30 18:14:57', '2024-12-01 06:14:57', 'student');
INSERT INTO `t_user_token` VALUES ('5', '747458b8-0e2e-4b3c-9dc3-989b0433611b', '2', 'oeIHv6wR7OI7bl4DlUq3nIzdn-Tk', '2024-11-30 18:30:15', '2024-12-01 06:30:15', 'admin');
INSERT INTO `t_user_token` VALUES ('6', 'c1178aab-de83-427b-8270-b7070254ac33', '2', 'oeIHv6wR7OI7bl4DlUq3nIzdn-Tk', '2024-12-02 08:34:44', '2024-12-02 20:34:44', 'admin');
INSERT INTO `t_user_token` VALUES ('9', '49bbb5e5-5299-4ce0-80cc-756089845de1', '1', 'oeIHv6wR7OI7bl4DlUq3nIzdn-Tk', '2024-12-02 09:40:54', '2024-12-02 21:40:54', 'student');
