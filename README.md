# Ритм — симулятор продакт-менеджера

Браузерный тренажёр: ты продакт в подписочном приложении-трекере привычек. 10 игровых месяцев, $600k на счету, цель — вырастить выручку, вывести LTV / CAC выше 3 и не остаться без денег.

**Играть:** https://sharipovrus.github.io/pm-sim/ · **Play in English:** https://sharipovrus.github.io/pm-sim/en/

Язык переключается кнопкой RU / EN в шапке.

## Что внутри

- **17 кейсов от стейкхолдеров.** CEO, маркетинг, техлид, поддержка, инвестор приносят проблемы. После каждого выбора — разбор: какой вариант сильнее и почему.
- **18 типов задач** с генерируемыми числами: LTV, окупаемость CAC, значимость A/B-теста, размер выборки, RICE, воронка, когортная таблица, CustDev, JTBD, модель Кано.
- **Экономическая модель.** Пользователи, удержание, конверсия, кэш и техдолг пересчитываются каждый месяц и реагируют на решения — иногда с задержкой.
- **Шпаргалка.** 58 терминов с расшифровкой аббревиатуры, переводом и формулой. Термины в тексте кликабельны.
- **Итоги.** Грейд от стажёра до Head of Product, достижения и список того, что стоит подтянуть.

Темы: discovery и CustDev, приоритизация и роадмап, метрики и юнит-экономика, A/B-тесты и аналитика.

## Технически

Одна HTML-страница без зависимостей и сборки. Прогресс хранится в localStorage браузера, сервер не используется, данные никуда не отправляются.

## Запуск локально

Открой `index.html` в браузере. Всё.

## Лицензия

MIT — делай что хочешь, упоминание авторства приветствуется.

---

## English

**Rhythm** is a browser-based product manager simulator. You're the PM of a habit-tracker subscription app: 10 in-game months, $600k in the bank, and the goal is to grow revenue, get LTV / CAC above 3 and not run out of cash.

- 17 stakeholder cases with a debrief after every call
- 18 challenge types with generated numbers: LTV, CAC payback, A/B test significance, sample size, RICE, funnels, cohort tables, customer interviews, JTBD, Kano
- A business model that recalculates users, retention, revenue, cash and tech debt every month
- A cheat sheet of 58 PM terms; terms in the text are clickable

One HTML file, no dependencies, no build, no backend. Progress is stored in your browser's localStorage. Switch languages with the RU / EN toggle in the header.
