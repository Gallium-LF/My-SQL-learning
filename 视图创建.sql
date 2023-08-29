--视图的创建
--创建视图语法格式
--CREATE VIEW <视图名称> (<属性名称>,[2,...,n])
--AS
--(SELECT 查询语句)
--[WITH CHECK OPTION]

--类型1：使用基本的全属性
--创建数学系同学视图S_MT
--USE JXGL
--GO
--	CREATE VIEW S_MT
--	AS
--	SELECT *
--	FROM S
--	WHERE SDPET='MT'
--	WITH CHECK OPTION--本语句只对可更新视图考虑使用
--GO

--SELECT *
--FROM S_MT

--类型2：使用基本部分属性
--创建数学系同学视图S_MT_AGE
--USE JXGL
--GO
--	CREATE VIEW S_MT_AGE (SNO,SNAME,AGE)
--	AS
--	SELECT SNO,SNAME,AGE
--	FROM S
--	WHERE SDPET='MT'
--	WITH CHECK OPTION--本语句只对可更新视图考虑使用
--GO

--SELECT *
--FROM S_MT_AGE

--类型3：使用基本表表达式属性
--创建同学本期选修课程的门数和相应平均成绩
--USE JXGL
--GO
--	CREATE VIEW C_G (SNO,C_NUM,AVG_GRADE)
--	AS
--	SELECT SNO,COUNT(CNO),AVG(GRADE)
--	FROM SC
--  WHERE GRADE IS NOT NULL
--	GROUP BY SNO
--GO

--SELECT *
--FROM C_G
