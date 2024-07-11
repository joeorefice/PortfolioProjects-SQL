-- teams with the highest average weight of its batters on a given year.

select avg(people.weight) as average_weight, teams.name, batting.yearid as year
from people
join batting
  on people.playerid = batting.playerid
join teams
  on batting.teamid = teams.teamid
group by teams.name, batting.yearid
order by avg(people.weight) desc;

-- team with the smallest average height of its batters on a given year.

select avg(people.height) as average_height, teams.name, batting.yearid as year
from people
join batting
  on people.playerid = batting.playerid
join teams
  on batting.teamid = teams.teamid
group by teams.name, batting.yearid
order by avg(people.height) asc;

-- team with the largest total salary of all players in a given year.

select teams.name, sum(salaries.salary), salaries.yearid
from salaries
left join teams
  on teams.yearid = salaries.yearid
  and teams.teamid = salaries.teamid
group by teams.name, salaries.yearid
order by salaries.yearid asc;

-- team that had the smallest “cost per win” in 2010, determined by the total salary of the team divided by the number of wins in a given year

select teams.name, round(sum(salaries.salary)/teams.w) as cost_per_win, salaries.yearid
from salaries
left join teams
  on teams.yearid = salaries.yearid
  and teams.teamid = salaries.teamid
  where salaries.yearid = 2010
group by teams.name, salaries.yearid, teams.w
order by cost_per_win asc;

-- the pitcher who, in a given year, cost the most money per game in which they were the starting pitcher

select people.namefirst, people.namelast, salaries.salary/pitching.gs as cost_per_game, salaries.yearid, pitching.gs
from salaries
join pitching
  on pitching.playerid = salaries.playerid
  and pitching.teamid = salaries.teamid
  and pitching.yearid = salaries.yearid
join people
  on people.playerid = salaries.playerid
  where pitching.gs > 10
order by cost_per_game desc;


-- the pitcher most likely to hit a batter with a pitch

select people.playerid, people.namefirst, people.namelast, pitching.hits as hits, pitching.hit_by_pitch as hbp, round(pitching.hit_by_pitch/pitching.hits, 3) as hbp_per_game
from (
  select playerid, cast(sum(h) as decimal) as hits, cast(sum(hbp) as decimal) as hit_by_pitch
  from pitching
  where (h > 0 and hbp is not null)
  group by playerid
  ) pitching
inner join people
  on pitching.playerid = people.playerid
order by hbp_per_game desc;
