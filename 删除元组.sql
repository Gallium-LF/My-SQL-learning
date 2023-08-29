--删除表数据
--DELETE
--FROM<表名>
--[WHERE<逻辑表达式>]
--删除单个元组
USE JXGL
GO
	DELETE FROM S$
	WHERE SNO='100002' 
GO

--删除多个元组
USE JXGL
GO
	DELETE FROM S$
	WHERE SNO='100002' OR SNO='100041' OR SNO='100042' 
GO

--带有子查询的删除操作
USE JXGL
GO
	DELETE FROM S$
	WHERE SNO IN
	(
		SELECT SNO
		FROM S$
		WHERE SDPET='M'
	)
GO