-- There were several cases of needing to find a specific column across a large tableset
-- This utility script helps me quickly check for which tables contain a specific column
-- Left variables in place for customization as needed for situation

USE %database%
GO
SELECT t.name AS table_name,
SCHEMA_NAME(schema_id) AS schema_name,
c.name AS column_name
FROM sys.tables AS t
INNER JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID
WHERE c.name LIKE '%columnname%'
ORDER BY schema_name, table_name;
