### Medium-hard problems  

#### Important tips and tricks:
* When using group by --> Each column in select must be in the group by condition or aggregated.
* Having is used to filter groups after aggregation unlike where clause, which is used to filter before grouping.
* Window functions are computed after group by and aggregation, they do not change the grouping.
* If a column is used in the window function, but isn't aggregated, then that column should be included in the select clause.
* You cannot use a window function result (row_number, rank) in where or having clause directly because these functions are processed after filtering.

#### Here is the execution plan of how SQL executes queries: 
--> from  
--> where  
--> group by  
--> having  
--> select  
  * Aggregate functions are calculated first    
  * Window functions are applied after aggregation but before ORDER BY or LIMIT  
--> order by  
--> limit/offset  
