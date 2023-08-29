--视图数据的更新
--不是所有视图都可以更新数据
--（1）行列子式视图可以更新
--（2）由多表产生的视图，或者存在属性由聚集函数或四则运算得到，则不可更新
--行列子式视图：产生视图得基本表是单表且保留基本表的主键
--为视图S_MT插入元组('100000','WANG','M',21,'MT')
--USE JXGL
--GO
--	INSERT INTO S_MT
--	VALUES ('100000','WANG','M',21,'MT')
--GO

--SELECT *
--FROM S_MT
--视图更新实质上是对相应的基本表的更新

--为视图S_MT_AGE插入元组('100051','ZHAO',21)
--USE JXGL
--GO
--	INSERT INTO S_MT_AGE
--	VALUES ('100051','ZHAO',21)
--GO

--SELECT *
--FROM S_MT_AGE

--创建一个不带有WITH CHECK OPTION视图S_MT1，为视图S_MT_AGE插入元组('100051','ZHAO',21)
--USE JXGL
--GO
--	CREATE VIEW S_MT1
--	AS
--	SELECT *
--	FROM S
--	WHERE SDPET='MT'
--GO
	INSERT INTO S_MT1 (SNO,SNAME,AGE)
	VALUES ('100051','ZHAO',21)

SELECT *
FROM S_MT1