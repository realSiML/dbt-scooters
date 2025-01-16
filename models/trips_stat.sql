select
	count(*) as trips,
	count(distinct user_id) as users,
	avg(extract(epoch from finished_at - started_at)) / 60 as avg_duration_m,
	sum(price) / 100 as revenue_rub,
	count(price = 0 or null) * 100 / cast(count(*) as real) as free_trips_pct
from scooters_raw.trips