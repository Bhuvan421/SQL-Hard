## Hard Problems

### Important tips and tricks:

* You can use `LAG` and `LEAD` on any ordered sequence of rows, depending on the ORDER BY you specify within the OVER clause. The lead/lag will be applied on the column specified inside order by within the over(). Partition By is optional.
  
* `coalesce` returns the first non-null value from a list of provided expressions.
  
* `generate_series` - creates a sequence of values from a specified start to a specified end, with an optional step. When you specify a column inside the function, it takes the value of that column and repeat the entire corresponding record (including all columns) those many times. You can give an alias to the generate function and use in the select clause. Or, you can create a window function like a row_number in select. Usually, the generate_series is used alongside `cross join`.  

* `justify functions family`:  
  ** `justify_hours` - get the difference of or convert the timestamp and, get the number of days within it and also give excess hours.  
                     example: look at the "server-utilization-time" SQL question in the hard folder.  
  ** `justify_days` - get the difference of the number of months in the interval and also give excess days within it.  
  ** `justify_interval` - Combination of justify_hours and justify_days which gives the difference in months, days, and hours within the interval.  
* Similar date functions include `extract`/`date_part`, `age`, etc.

* `epoch` - to retrieve time difference in seconds by using extract/date_part. Look at "repeated-payments" SQL question in the hard folder.
