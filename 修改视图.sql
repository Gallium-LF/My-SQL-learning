--视图更新
--修改视图S_MT，使得只是男同学的数据，修改选择条件，还可以修改属性
--USE JXGL
--GO
--	ALTER VIEW S_MT
--	AS
--	SELECT *
--	FROM S
--	WHERE SDPET='MT' AND SEX='M'
--GO
--SELECT *
--FROM S_MT

--删除视图C_G
USE JXGL
GO
	DROP VIEW C_G
GO