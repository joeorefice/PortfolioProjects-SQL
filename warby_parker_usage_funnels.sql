/*
Creating quiz funnel between the following style quiz questions, determining response percentages;

1. “What are you looking for?”
2. “What’s your fit?”
3. “Which shapes do you like?”
4. “Which colors do you like?”
5. “When was your last eye exam?”
*/

select
  question,
  count(distinct(user_id)) as response_count,
  (COUNT(DISTINCT user_id) * 100.0 / 500) AS response_percent
from
  survey
group by 1;


/*
Creating pseudo-table of user_id, is_home_try_on (prescence of user in home_try_on table), number_of_pairs, is_purchase (presence of user in purchase table)
*/

select
  distinct q.user_id,
  h.user_id is not null as is_home_try_on,
  h.number_of_pairs, p.user_id is not null as is_purchase
from
  quiz q
left join
  home_try_on h on q.user_id = h.user_id
left join
  purchase p on p.user_id = q.user_id
limit 10;

/*

Analyzing the data:

- Comparing conversion from quiz→home_try_on and home_try_on→purchase.
*/

select
  count(distinct q.user_id) as quiz_users,
  sum(h.user_id is not null) as is_home_try_on,
  sum(p.user_id is not null) as is_purchase,
  sum(h.user_id is not null) * 100.0 / count(distinct(q.user_id)) as q_to_h_percent,
  sum(p.user_id is not null) * 100.0 / sum(h.user_id is not null) as h_to_p_percent
from
  quiz q
left join
  home_try_on h on q.user_id = h.user_id
left join
  purchase p on p.user_id = q.user_id;

/*
- Calculating the difference in purchase rates between customers who had 3 number_of_pairs with ones who had 5.

*/

select
  h.number_of_pairs,
  count(distinct q.user_id) as quiz_users,
  sum(h.user_id is not null) as is_home_try_on,
  sum(p.user_id is not null) as is_purchase,
  sum(h.user_id is not null) * 100.0 / count(distinct(q.user_id)) as q_to_h_percent,
  (SUM(p.user_id IS NOT NULL) * 100.0 / NULLIF(SUM(h.user_id IS NOT NULL), 0)) AS h_to_p_percent
from
  quiz q
left join
  home_try_on h on q.user_id = h.user_id
left join
  purchase p on p.user_id = q.user_id
group by 1;
