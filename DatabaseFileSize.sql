-- Regularly need to monitor database sizes for potential shrinking or balacing
-- This is my quick utility script to check "at a glance" for out of control DBs

SELECT DB_NAME(database_id) AS database_name, 
    type_desc, 
    name AS FileName, 
    size/128.0 AS CurrentSizeMB
FROM sys.master_files
WHERE database_id > 6 AND type IN (0,1)
