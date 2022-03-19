select * from sales

where (
	Extract(Year from to_date("Ship Date", 'MM/DD/YYYY'))=
	(select max(Extract(Year from to_date("Ship Date", 'MM/DD/YYYY'))) from sales)
or
	Extract(Year from to_date("Ship Date", 'MM/DD/YYYY'))=
	(select max(Extract(Year from to_date("Ship Date", 'MM/DD/YYYY')))-2 from sales)
or
	Extract(Year from to_date("Ship Date", 'MM/DD/YYYY'))=
	(select max(Extract(Year from to_date("Ship Date", 'MM/DD/YYYY')))-4 from sales)
) and
	region like '%a'
	order by "Units Sold" desc;