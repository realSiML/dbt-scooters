with count_cte as (
	select
		t.started_at::date as date,
		extract(year from age(started_at, birth_date)) as age,
		count(*) as trips
	from scooters_raw.trips t
	join scooters_raw.users u on u.id = t.user_id
	group by
		1, 2
)

select age, avg(trips) as avg_trips
from count_cte
group by
	1
order by
	1