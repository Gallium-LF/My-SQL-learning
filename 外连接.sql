--外连接查询 与内连接不同，外连接通常都在from子句中实现而不用where子句
--查询是否选修c003号课程的同学信息（左外连接）
USE JXGL
GO
	SELECT S$.*,CNO,GRADE
	FROM S$ LEFT JOIN SC$ ON S$.SNO=SC$.SNO AND SC$.CNO='C003'
GO

--查询是否选修c003号课程的同学信息（右外连接）
USE JXGL
GO
	SELECT S$.*,CNO,GRADE
	FROM S$ RIGHT JOIN SC$ ON S$.SNO=SC$.SNO AND SC$.CNO='C003'
GO

--查询是否选修c003号课程的同学信息（全外连接）
USE JXGL
GO
	SELECT S$.*,CNO,GRADE
	FROM S$ FULL JOIN SC$ ON S$.SNO=SC$.SNO AND SC$.CNO='C003'
GO

--查询是否选修c003号课程的同学信息（全内连接）
USE JXGL
GO
	SELECT S$.*,CNO,GRADE
	FROM S$ INNER JOIN SC$ ON S$.SNO=SC$.SNO AND SC$.CNO='C003'
GO