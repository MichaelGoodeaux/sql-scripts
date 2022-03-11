-- On a regular basis, I need to see which queries are running as often times I need to kill something stuck. 
-- While there are multiple ways to go about this, I frankensteined this query together in order to see which queries were long running and hogging resources

SELECT sqltext.TEXT,
req.session_id,
req.status,
req.command,
req.cpu_time,
req.total_elapsed_time
FROM sys.dm_exec_requests req
CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS sqltext
