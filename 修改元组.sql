--修改表数据
--UPDATE<表名>
--SET <列名>=<表达式>[，，，，n]
--[WHERE<逻辑表达式>]
--修改单个元组
USE JXGL
GO
	UPDATE S$
	SET SNAME='PEETER',AGE=21
	WHERE SNO='100002'
GO

--修改多个元组
USE JXGL
GO
	UPDATE S$
	SET AGE=AGE+1
	WHERE SDPET='MT'
GO

--带有子查询的修改操作
USE JXGL
GO
	UPDATE SC$
	SET GRADE=0
	WHERE SNO IN
		(
			SELECT SNO
			FROM S$
			WHERE SDPET='MT'
		)
GO