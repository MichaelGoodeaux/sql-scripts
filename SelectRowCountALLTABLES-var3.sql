-- One of 4 of my SQL scripts that I use in specific situations to get row counts for all tables across all databases. 
-- This helps when comparing this information across migratory processes.

DECLARE @TableRowCounts TABLE ([TableName] VARCHAR(128), [RowCount] BIGINT) ;
INSERT INTO @TableRowCounts ([TableName], [RowCount])
EXEC sp_MSforeachtable 'SELECT ''?'' [TableName], COUNT(*) [RowCount] FROM ?' ;
SELECT [TableName], [RowCount]
FROM @TableRowCounts
ORDER BY [TableName]
GO
