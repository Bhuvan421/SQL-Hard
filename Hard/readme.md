## Hard Problems

### Important tips and tricks:

* You can use LAG and LEAD on any ordered sequence of rows, depending on the ORDER BY you specify within the OVER clause. The lead/lag will be applied on the column specified inside order by within the over(). Partition by is optional.
  
* Use coalesce returns the first non-null value from a list of provided expressions.
  
* `Generate_series` function - creates a sequence of values from a specified start to a specified end, with an optional step. When you specify a column inside the function, it takes the value of that column and repeat the entire corresponding record (including all columns) those many times. You can give alias to the generate function and use in select clause. Or, you can create a window function like a row_number in select. Usually, the generate_series is used alongside `cross join`.
