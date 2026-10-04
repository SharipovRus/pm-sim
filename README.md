# Ритм — симулятор продакт-менеджера

Браузерный тренажёр: ты продакт в подписочном приложении-трекере привычек. 10 игровых месяцев и $350k на счету. После 5-го месяца инвестор решит, давать ли второй транш: нужен рост MRR на 25%. Цель — вырастить выручку, вывести LTV / CAC выше 3 и не остаться без денег.

**Играть:** https://sharipovrus.github.io/pm-sim/ · **Play in English:** https://sharipovrus.github.io/pm-sim/en/

Язык переключается кнопкой RU / EN в шапке.

## Что внутри

- **35 кейсов от стейкхолдеров.** CEO, маркетинг, техлид, поддержка, инвестор приносят проблемы. После каждого выбора — разбор: какой вариант сильнее и почему. Шесть кейсов — дилеммы: в них два сильных варианта с разной ценой, и решаешь ты, чем платить.
- **17 типов задач** с генерируемыми числами: LTV, окупаемость CAC, значимость A/B-теста, размер выборки, RICE, воронка, когортная таблица, CustDev, JTBD, модель Кано.
- **Экономическая модель.** Пользователи, удержание, конверсия, кэш и техдолг пересчитываются каждый месяц и реагируют на решения — иногда с задержкой. В итогах месяца ты задаёшь маркетинговый бюджет и долю команды на техдолг.
- **Шпаргалка.** 58 терминов с расшифровкой аббревиатуры, переводом и формулой. Термины в тексте кликабельны.
- **Итоги.** Грейд от стажёра до Head of Product, достижения, список того, что стоит подтянуть, и карточка результата, которой можно поделиться.
- **Сертификат и лидерборд.** За полное прохождение — именной сертификат с проверкой по ссылке и кнопкой «добавить в профиль LinkedIn». Лучший результат можно отправить в общий рейтинг.

Темы: discovery и CustDev, приоритизация и роадмап, метрики и юнит-экономика, A/B-тесты и аналитика.

## Технически

Одна HTML-страница без зависимостей и сборки. Прогресс хранится в localStorage браузера. Посещения считает GoatCounter — без cookies и без персональных данных. Если отправить результат в лидерборд, в Supabase сохраняются ник, необязательная ссылка на LinkedIn и лучший результат.

## Запуск локально

Открой `index.html` в браузере. Всё.

## Лицензия

Все права защищены. Играть, читать код для обучения и делиться ссылками, результатами и сертификатами можно свободно. Копировать игру или её контент, размещать у себя, менять и использовать в коммерческих целях (курсы, корпоративное обучение, найм) — только с письменного разрешения автора. Подробности — в [LICENSE](LICENSE). По вопросам лицензии и партнёрства: sharipovra94@gmail.com, [LinkedIn](https://www.linkedin.com/in/sharipov-ruslan/).

Версии, опубликованные до смены лицензии, остаются под MIT.

---

## English

**Rhythm** is a browser-based product manager simulator. You're the PM of a habit-tracker subscription app: 10 in-game months and $350k in the bank. After month 5 the investor decides on a second tranche, and they want MRR up 25%. The goal is to grow revenue, get LTV / CAC above 3 and not run out of cash.

- 35 stakeholder cases with a debrief after every call, including 6 dilemmas where both strong options come at a different price
- 17 challenge types with generated numbers: LTV, CAC payback, A/B test significance, sample size, RICE, funnels, cohort tables, customer interviews, JTBD, Kano
- A business model that recalculates users, retention, revenue, cash and tech debt every month; you set the marketing budget and how much of the team goes to tech debt
- A cheat sheet of 58 PM terms; terms in the text are clickable
- A shareable result card with your grade and metrics at the end
- A verifiable certificate for a full run, with an “Add to LinkedIn profile” button, and a public leaderboard

One HTML file, no dependencies, no build, no backend. Progress is stored in your browser's localStorage. Visits are counted with GoatCounter: no cookies, no personal data. If you submit to the leaderboard, your nickname, optional LinkedIn link and best score are stored in Supabase. Switch languages with the RU / EN toggle in the header.

**License.** All rights reserved. You're free to play, read the code to learn from it and share links, results and certificates. Copying, hosting, modifying or commercial use (courses, corporate training, hiring) requires the author's written permission — see [LICENSE](LICENSE). Contact: sharipovra94@gmail.com, [LinkedIn](https://www.linkedin.com/in/sharipov-ruslan/). Versions published before this change remain under MIT.
