--带有子查询的插入操作
--对每个系求同学的平均年龄并保存在DEPT_AGE
USE JXGL
GO
	CREATE TABLE DEPT_AGE
	(
		SDEPT VARCHAR(50),
		AVG_AGE SMALLINT
	)
	
	INSERT INTO DEPT_AGE(SDEPT,AVG_AGE)
	SELECT SDPET,AVG(AGE)
	FROM S$
	GROUP BY SDPET
GO