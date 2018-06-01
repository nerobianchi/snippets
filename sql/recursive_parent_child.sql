with cte as(
	select
		c1.Name,
		c1.PKId,
		c1.FKId,
		1 as Level
	from
		TableName c1
	where
		FKId is null
union all select
		c2.Name,
		c2.PKId,
		c2.FKId,
		Level + 1
	from
		TableName c2 
		inner join cte on c2.FKId = cte.PKId
	where
		c2.FKId is not null
) select
	*
from
	cte
order by
	Level,
	3,
	2
