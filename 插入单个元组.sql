--插入表数据
	--INSERT
	--INTO <表名>[(<列名>[1,,,,n])]
	--VALUES(<常量表达式>|NULL|DEFAULT[,,,,n])
--1.插入单个元组
--（1）插入完全元组
--USE JXGL
--GO
--	INSERT
--	INTO S$
--	VALUES('100011','JONES','M',21,'IS')
	
--	SELECT *
--	FROM S$
--GO

--(2)插入不完全元组('100015','WHITE')
USE JXGL
GO
	INSERT
	INTO S$(SNO,SNAME)
	VALUES('100015','WHITE')
	
	SELECT *
	FROM S$
GO