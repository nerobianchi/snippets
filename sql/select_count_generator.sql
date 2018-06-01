select 
	'select (select count(1) from [' + name +'] with (nolock)) as Counter, ''' + name + ''' as Name union all ' as "Counter",
	'select count(1) from [' + name +'] union all ',
	'(select count(1) from [' + name +']) as "'+ name +'",',
	'(select * from [' + name +'] with (nolock))',
	'truncate table [' + name +']' as "Truncate"
from
	sys.tables 
where name != 'sysdiagrams'

union all

select
	'order by 1 desc',
	'',
	'',
	'',
	''
order by 2 desc 

