# Матрица компетенций продакт-менеджера · PM competency matrix

Матрица, по которой «Ритм» оценивает игрока: 7 компетенций × 5 уровней. The matrix Rhythm uses to assess the player: 7 competencies × 5 levels.

Играть / Play: https://sharipovrus.github.io/pm-sim/ · https://sharipovrus.github.io/pm-sim/en/

**Источники / Sources:**

- [Avito — Product manager profiles (GitHub, avito-tech/playbook)](https://github.com/avito-tech/playbook/blob/master/product-levels.md)
- [GitLab — Product Management CDF and Competencies](https://handbook.gitlab.com/handbook/product/product-management/product-cdf-competencies/)
- [Intercom — Product Manager expectations by level](https://www.intercom.com/blog/evolving-your-product-management-career-ladder/)
- [Wise — Product career map](https://wise.jobs/product-career-map)
- [Monzo — Product progression framework (GitHub)](https://github.com/monzo/progression-framework/blob/master/frameworks/product.md)
- [Atlassian — Career growth for product managers](https://www.atlassian.com/company/careers/resources/career-growth/product-managers)
- [UK Government DDaT — Product manager](https://understand-digital-data-roles-skills.service.gov.uk/role/product-manager)

**Как считается уровень / How levels are scored:** каждый кейс и задача относятся к 1–2 компетенциям (основная — полный вес, вторая — половина); к бизнесу, стейкхолдерам, лидерству и execution добавляется состояние продукта (MRR и LTV / CAC, доверие, мораль, техдолг). Уровень: Middle от 50%, Senior от 65%, Lead от 80%, Head от 90%, и не выше, чем позволяет число ходов (1 → Middle, 2–3 → Senior, 4–5 → Lead, 6+ → Head). / Each case and challenge maps to 1–2 competencies (primary full weight, secondary half); business, stakeholders, leadership and execution also take in the state of the product (MRR and LTV / CAC, trust, morale, tech debt). Level: Middle from 50%, Senior from 65%, Lead from 80%, Head from 90%, capped by how often the competency came up (1 move → Middle, 2–3 → Senior, 4–5 → Lead, 6+ → Head).

## Русский

Модель компетенций игры собрана из публичных PM-фреймворков Авито, GitLab, Intercom, Wise, Monzo и Atlassian, а также рамки Digital and Data (DDaT) правительства Великобритании; лидерство на уровнях Lead и Head сверено с исследованием Google re:Work о менеджерах (Project Oxygen). Пять уровней: Junior → Middle → Senior → Lead → Head. Игра измеряет то, что можно показать решениями в симуляции, поэтому техническая и доменная экспертиза и менторство отдельно не оцениваются.

### 1. Пользователь и дискавери

**Что это:** Находит и чётко формулирует самые ценные проблемы пользователей и проверяет гипотезы до того, как вкладываться в разработку.

**Как измеряется в игре:** Кейсы и задачи про CustDev-интервью, JTBD, выбор метода исследования и проверку проблемы до разработки.

| Уровень | Поведение |
| --- | --- |
| Junior | Пользуется своим продуктом и замечает, где ломается путь пользователя. Проводит интервью по готовому гайду и пишет простой problem statement. |
| Middle | Сам планирует исследование и сочетает качественные и количественные методы. Сводит разрозненный фидбек в одну проблему и проверяет гипотезу до разработки. |
| Senior | Формулирует сложные проблемы так, что команда может пересказать их сама. Сокращает цикл дискавери, подтверждает гипотезы пилотами и разрешает конфликты между нуждами сегментов. |
| Lead | Задаёт повестку исследований для нескольких команд. Находит новые рыночные возможности, обосновывает их и учит других проверять идеи до разработки. |
| Head | Строит в компании систему «сенсоров»: работу с ключевыми клиентами и research ops. Сам представляет продукт стратегическим клиентам и задаёт стандарт дискавери. |

**Основа:** Авито: Качество и скорость дискавери · GitLab: Sensing Mechanisms · Intercom: Insight Driven · Monzo: User-centricity · UK DDaT: Applying user-centred insights

### 2. Стратегия и видение

**Что это:** Определяет, куда и зачем движется продукт, и превращает это в роадмап с понятным обоснованием.

**Как измеряется в игре:** Кейсы про роадмап и фокус продукта: запросы CEO, давление инвестора и выбор, что делать, а от чего отказаться.

| Уровень | Поведение |
| --- | --- |
| Junior | Своими словами пересказывает стратегию продукта и видит, как в неё ложится его задача. Предлагает бэклог под краткосрочные цели и разбирает конкурентов. |
| Middle | Владеет роадмапом команды и описывает end vision: желаемый путь клиента и уникальную ценность. Объясняет, почему выбраны именно эти приоритеты. |
| Senior | Строит стратегию в неоднозначной зоне почти без подсказок, опираясь на рынок и целевую аудиторию. Держит долгосрочный роадмап, и его стратегия влияет на соседние команды. |
| Lead | Формирует стратегию группы команд на 12+ месяцев и раздаёт командам миссии. Ревьюит чужие роадмапы и берёт самые неопределённые зоны без подсказок. |
| Head | Связывает продуктовую стратегию с целями компании на горизонте 3–5 лет. Вместе с топ-менеджментом решает, в какие рынки и бизнесы идти, а в какие нет. |

**Основа:** Авито: Формирование долгосрочного продуктового видения · GitLab: Product Roadmap & Product Led Growth · Intercom: Strategy definition & influence · Atlassian: Lead and inspire · UK DDaT: Strategic ownership

### 3. Приоритизация и execution

**Что это:** Выбирает главное, режет scope, держит ритм поставки и вместе с инженерами балансирует новые фичи и техдолг.

**Как измеряется в игре:** Кейсы и задачи на приоритизацию (RICE, MoSCoW, модель Кано) и разговоры с техлидом, плюс то, как ты держишь техдолг.

| Уровень | Поведение |
| --- | --- |
| Junior | Декомпозирует задачи по шаблону и сдаёт фичи в срок. Снимает блокеры с помощью руководителя и прозрачно сообщает статус и риски. |
| Middle | Приоритизирует бэклог по ценности и затратам, режет scope до MVP. Говорит с инженерами на одном языке: учитывает реализуемость, зависимости и риски, сам снимает блокеры. |
| Senior | Балансирует новые фичи, баги и техдолг, срочное и важное. Поднимает скорость и качество команды, стабильно выполняет прогнозы по эффекту и разруливает зависимости между командами. |
| Lead | Отвечает за исполнение в нескольких командах и сложных проектах с множеством зависимостей. Вводит фреймворки приоритизации и устраняет системные причины низкой скорости и качества. |
| Head | Задаёт критерии эффективности команд, распределяет ресурсы между направлениями и снимает организационные блокеры на уровне компании. |

**Основа:** Авито: Планирование и организация работ · Intercom: Shipping is our heartbeat · Wise: Execution · Atlassian: Deliver outcomes · UK DDaT: Agile and lean practices

### 4. Данные и эксперименты

**Что это:** Принимает решения на данных: строит дерево метрик, ставит цели в цифрах, проектирует и читает эксперименты.

**Как измеряется в игре:** Кейсы и задачи про A/B-тесты, выборку, гипотезы, основную метрику теста, воронки и когорты.

| Уровень | Поведение |
| --- | --- |
| Junior | Отслеживает метрики своей фичи и объясняет, что означают цифры. Выводы о влиянии на бизнес делает вместе со старшими. |
| Middle | Задаёт success-метрику до запуска и запускает A/B по чёткой гипотезе. Учитывает шум и тренды; с помощью старших строит дерево метрик и двигает input-метрики ради output. |
| Senior | Сам строит дерево метрик и находит точки роста, которыми никто не занимается. Понимает, как метрики продукта двигают бизнес, проектирует эксперименты и меняет курс по их итогам. |
| Lead | Решает, какой анализ нужен нескольким командам, связывает метрики разных продуктов и задаёт метрики стратегии. Принимает решения при множестве взаимозависимых факторов. |
| Head | Строит систему метрик компании вокруг North Star и культуру экспериментов. Инвестирует в платформу данных и экспериментов. |

**Основа:** Авито: Аналитика · GitLab: KPIs and Metrics · Intercom: Analytics focus · Monzo: Data Skills · UK DDaT: Managing product outcomes

### 5. Бизнес и экономика продукта

**Что это:** Понимает, как продукт создаёт ценность и зарабатывает (юнит-экономика, финмодель, монетизация), и отвечает за бизнес-результат, а не за число выпущенных фич.

**Как измеряется в игре:** Задачи на LTV, окупаемость CAC и MRR, кейсы про цену и маркетинговый бюджет, плюс итоговые MRR, LTV / CAC и транш инвестора.

| Уровень | Поведение |
| --- | --- |
| Junior | Знает бизнес-модель продукта и экономику своей фичи, понимает целевые бизнес-метрики команды. |
| Middle | Считает эффект фичи в деньгах и с поддержкой строит финмодель доходов. Аргументирует финансовую привлекательность инициатив и показывает измеримый эффект. |
| Senior | Строит модели доходов и расходов со сценариями и решает по ROI. Пишет бизнес-кейсы (build / buy / partner), участвует в прайсинге и двигает ключевые бизнес-метрики. |
| Lead | Отвечает за бизнес-результат нескольких продуктов или направления. Готовит инвестиционные кейсы уровня компании и находит крупные возможности роста или экономии. |
| Head | Отвечает за P&L или выручку направления, запускает новые бизнесы и рынки и балансирует инвестиционный портфель. |

**Основа:** Авито: Финансовое моделирование · GitLab: Value Creation · Intercom: Driving Outcomes · Wise: Impact · UK DDaT: Creating value for money

### 6. Стейкхолдеры и коммуникации

**Что это:** Ясно доносит сложное, договаривается со стейкхолдерами, строит доверие и аргументированно защищает решения.

**Как измеряется в игре:** Кейсы с CEO, маркетингом, поддержкой и инвестором, плюс итоговое доверие и то, насколько маркетинг следует твоей рекомендации.

| Уровень | Поведение |
| --- | --- |
| Junior | Кратко и ясно сообщает статус, проблемы и риски, аргументирует позицию и задаёт уточняющие вопросы. В конфликте ставит обсуждение на паузу и подключает руководителя. |
| Middle | Выравнивает команду и ключевых стейкхолдеров вокруг роадмапа, адаптирует подачу под аудиторию. Пишет документы «от общего к частному», сам даёт и просит обратную связь. |
| Senior | Доводит сложные переговоры и конфликты до конструктивного решения. Уверенно защищает решения перед топ-менеджментом и широкой аудиторией, представляет продукт клиентам. |
| Lead | Строит доверие с senior-стейкхолдерами по всей компании и выравнивает несколько команд. Корректно эскалирует блокеры; его признают экспертом внутри и снаружи. |
| Head | Публичное лицо продукта на конференциях и встречах с ключевыми клиентами. Выстраивает коммуникационные ритуалы организации и умеет доносить трудные решения. |

**Основа:** Авито: Эффективные коммуникации · Intercom: Alignment & Evangelism · Monzo: Communication and Feedback · Atlassian: Great communicator · UK DDaT: Stakeholder relationship management

### 7. Лидерство и решения

**Что это:** Берёт ownership за результат, принимает решения вовремя и в условиях неопределённости, взвешивает трейд-офы и держит команду в рабочем состоянии.

**Как измеряется в игре:** Дилеммы без единственно верного ответа, инциденты и мораль команды: решаешь ли ты вовремя и держишь ли команду в форме.

| Уровень | Поведение |
| --- | --- |
| Junior | Отвечает за свои задачи и доводит их до конца, активно участвует в жизни команды. Самостоятельно принимает решения в узкой, понятной зоне. |
| Middle | Сам принимает решения в своей зоне и задаёт ритм и договорённости команды. Поддерживает здоровье команды: вовремя снимает конфликты и инерцию. |
| Senior | Ведёт как servant leader: команда сама генерирует и проверяет идеи. Решает при неполных данных, явно называя трейд-офы, и помогает расти младшим PM. |
| Lead | Ведёт группу команд, управляет PM и коучит их. Вводит общие практики, которые поднимают планку, и строит сильные связи между направлениями. |
| Head | Строит продуктовую организацию: найм, структура, PM-культура. Управляет менеджерами, коучит людей и даёт команде ясность в трудных решениях (поведения Project Oxygen). |

**Основа:** GitLab: Aligning Teams with HPT · Intercom: Ownership, Decisiveness · Wise: Leadership · Monzo: Works Through Others · Google re:Work (Project Oxygen)

## English

The game’s competency model is assembled from the public PM frameworks of Avito, GitLab, Intercom, Wise, Monzo and Atlassian, plus the UK government’s Digital and Data (DDaT) framework; leadership at the Lead and Head levels is cross-checked against Google re:Work research on managers (Project Oxygen). There are five levels: Junior → Middle → Senior → Lead → Head. The game measures what can be shown through decisions in a simulation, so technical and domain expertise and mentoring are not scored separately.

### 1. Customer insight & discovery

**What it is:** Finds and clearly frames the most valuable user problems and tests hypotheses before investing in development.

**How the game measures it:** Cases and tasks on customer interviews, JTBD, choosing a research method and validating the problem before building.

| Level | Behavior |
| --- | --- |
| Junior | Uses the product and notices where the user journey breaks. Runs interviews from a ready-made guide and writes a simple problem statement. |
| Middle | Plans research on their own, combining qualitative and quantitative methods. Turns scattered feedback into one clear problem and validates the hypothesis before building. |
| Senior | Frames complex problems so clearly that the team can retell them. Shortens the discovery cycle, confirms hypotheses with pilots and resolves conflicts between segments’ needs. |
| Lead | Sets the research agenda for several teams. Spots new market opportunities, builds the case for them and teaches others to validate ideas before building. |
| Head | Builds company-wide sensing mechanisms such as key-account programs and research ops. Represents the product to strategic customers and sets the bar for discovery. |

**Based on:** Avito: Discovery quality and speed · GitLab: Sensing Mechanisms · Intercom: Insight Driven · Monzo: User-centricity · UK DDaT: Applying user-centred insights

### 2. Strategy & vision

**What it is:** Defines where the product is going and why, and turns that into a roadmap with a clear rationale.

**How the game measures it:** Cases on the roadmap and product focus: CEO requests, investor pressure and choosing what to do and what to drop.

| Level | Behavior |
| --- | --- |
| Junior | Can retell the product strategy in their own words and see how their work fits into it. Proposes a backlog for short-term goals and analyzes competitors. |
| Middle | Owns the team’s roadmap and describes the end vision: the target customer journey and unique value. Explains why these priorities were chosen over others. |
| Senior | Builds strategy in ambiguous areas with little guidance, grounded in the market and target audience. Holds a long-term roadmap that shapes neighboring teams’ plans. |
| Lead | Sets a 12+ month strategy for a group of teams and gives each team its mission. Reviews other roadmaps and takes on the most uncertain areas unprompted. |
| Head | Ties product strategy to company goals over a 3–5 year horizon. Decides with the leadership team which markets and businesses to enter and which to skip. |

**Based on:** Avito: Shaping a long-term product vision · GitLab: Product Roadmap & Product Led Growth · Intercom: Strategy definition & influence · Atlassian: Lead and inspire · UK DDaT: Strategic ownership

### 3. Prioritization & execution

**What it is:** Picks what matters most, cuts scope, keeps a steady delivery rhythm and works with engineering to balance new features against tech debt.

**How the game measures it:** Prioritization cases and tasks (RICE, MoSCoW, the Kano model) and calls with the tech lead, plus how you keep tech debt in check.

| Level | Behavior |
| --- | --- |
| Junior | Breaks work down using a template and ships features on time. Clears blockers with their manager’s help and is open about status and risks. |
| Middle | Prioritizes the backlog by value and cost and cuts scope to an MVP. Speaks engineering’s language: weighs feasibility, dependencies and risks, and clears blockers alone. |
| Senior | Balances new features, bugs and tech debt, the urgent and the important. Raises the team’s speed and quality, reliably hits impact forecasts and untangles cross-team dependencies. |
| Lead | Owns delivery across several teams and complex projects with many dependencies. Introduces prioritization frameworks and fixes the root causes of slow, low-quality delivery. |
| Head | Sets effectiveness criteria for teams, allocates resources across product areas and removes organizational blockers at company level. |

**Based on:** Avito: Planning and organizing work · Intercom: Shipping is our heartbeat · Wise: Execution · Atlassian: Deliver outcomes · UK DDaT: Agile and lean practices

### 4. Data & experimentation

**What it is:** Makes decisions with data: builds a metric tree, sets numeric goals, and designs and reads experiments.

**How the game measures it:** Cases and tasks on A/B tests, sample size, hypotheses, a test’s primary metric, funnels and cohorts.

| Level | Behavior |
| --- | --- |
| Junior | Tracks their feature’s metrics and can explain what the numbers mean. Draws conclusions about business impact together with senior colleagues. |
| Middle | Sets a success metric before launch and runs A/B tests on a clear hypothesis. Accounts for noise and trends; with support, builds a metric tree and moves inputs to drive outputs. |
| Senior | Builds the metric tree alone and finds growth levers nobody is working on. Understands how product metrics move the business, designs experiments and changes course on the results. |
| Lead | Decides what analysis several teams need, links metrics across products and sets the metrics for the strategy. Makes calls when many interdependent factors are in play. |
| Head | Builds the company’s metric system around a North Star and an experimentation culture. Invests in the data and experimentation platform. |

**Based on:** Avito: Analytics · GitLab: KPIs and Metrics · Intercom: Analytics focus · Monzo: Data Skills · UK DDaT: Managing product outcomes

### 5. Business & product economics

**What it is:** Understands how the product creates value and makes money (unit economics, financial model, monetization) and owns business results, not the number of features shipped.

**How the game measures it:** Tasks on LTV, CAC payback and MRR, cases on pricing and the marketing budget, plus your final MRR, LTV / CAC and the investor’s tranche.

| Level | Behavior |
| --- | --- |
| Junior | Knows the product’s business model and the economics of their feature, and understands the team’s target business metrics. |
| Middle | Estimates a feature’s impact in money and builds a revenue model with support. Makes the financial case for initiatives and shows measurable impact. |
| Senior | Builds revenue and cost models with scenarios and decides by ROI. Writes business cases (build / buy / partner), shapes pricing and moves key business metrics. |
| Lead | Owns business results for several products or a whole product area. Prepares company-level investment cases and finds big opportunities for growth or savings. |
| Head | Owns the P&L or revenue of a product area, launches new businesses and markets, and balances the investment portfolio. |

**Based on:** Avito: Financial modeling · GitLab: Value Creation · Intercom: Driving Outcomes · Wise: Impact · UK DDaT: Creating value for money

### 6. Stakeholders & communication

**What it is:** Explains complex things clearly, reaches agreement with stakeholders, builds trust and backs decisions with solid arguments.

**How the game measures it:** Cases with the CEO, marketing, support and the investor, plus your final trust and how closely marketing follows your recommendation.

| Level | Behavior |
| --- | --- |
| Junior | Reports status, problems and risks briefly and clearly, argues their position and asks clarifying questions. In a conflict, pauses the discussion and brings in their manager. |
| Middle | Aligns the team and key stakeholders around the roadmap and tailors the message to the audience. Writes docs that go from big picture to detail; gives and asks for feedback. |
| Senior | Steers difficult negotiations and conflicts to a constructive outcome. Confidently defends decisions to senior leadership and large audiences, and presents the product to customers. |
| Lead | Builds trust with senior stakeholders across the company and aligns several teams. Escalates blockers the right way and is recognized as an expert inside and outside. |
| Head | The public face of the product at conferences and with key customers. Sets up the organization’s communication rituals and knows how to deliver hard decisions. |

**Based on:** Avito: Effective communication · Intercom: Alignment & Evangelism · Monzo: Communication and Feedback · Atlassian: Great communicator · UK DDaT: Stakeholder relationship management

### 7. Leadership & decision-making

**What it is:** Takes ownership of outcomes, makes timely decisions under uncertainty, weighs trade-offs and keeps the team healthy.

**How the game measures it:** Dilemmas with no single right answer, incidents and team morale: whether you decide in time and keep the team in shape.

| Level | Behavior |
| --- | --- |
| Junior | Owns their tasks and sees them through, and takes an active part in team rituals. Makes decisions independently within a narrow, well-defined area. |
| Middle | Makes decisions in their own area and sets the team’s rhythm and working agreements. Keeps the team healthy by defusing conflict and inertia early. |
| Senior | Leads as a servant leader: the team generates and tests ideas on its own. Decides on incomplete data while naming the trade-offs explicitly, and helps junior PMs grow. |
| Lead | Leads a group of teams, managing and coaching PMs. Introduces shared practices that raise the bar and builds strong links between product areas. |
| Head | Builds the product organization: hiring, structure and PM culture. Manages managers, coaches people and gives the team clarity on hard calls (Project Oxygen behaviors). |

**Based on:** GitLab: Aligning Teams with HPT · Intercom: Ownership, Decisiveness · Wise: Leadership · Monzo: Works Through Others · Google re:Work (Project Oxygen)

---

© 2026 Ruslan Sharipov. Тексты уровней — пересказ публичных фреймворков, перечисленных выше, адаптированный для игры. Level texts paraphrase the public frameworks listed above, adapted for the game.
