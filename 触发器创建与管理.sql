--触发器
--触发器是一种特殊存储过程，用于处理具体应用场景中的数据库完整性
--为s表创建一个触发器；在insert和update时进行提示
--（1）创建触发器
USE JXGL
GO
	CREATE TRIGGER S_I_U
	ON S
	FOR 
	INSERT,UPDATE
	AS
		PRINT'inserted or updated for table S'
GO
--（2）测试触发器
USE JXGL
GO
	UPDATE S
	SET SNAME='BROOK'
	WHERE SNO='100002'
GO
--数据库级触发器：为JXGL创建一个触发器：在用户对于数据库中表删除时进行禁止删除提示
--同时，回滚到删除表的操作始点
--（1）创建触发器SAFETY
USE JXGL
GO
	CREATE TRIGGER SAFETY
	ON DATABASE --SAFETY是数据库级触发器
	AFTER 
	DROP_TABLE
	AS 
		PRINT 'NO DELETING THE TABLE'
		ROLLBACK TRANSACTION
GO
--（2）测试触发器
USE JXGL
GO
	DROP TABLE SC
GO
--为s表创建一个delete类型触发器DEL_COUNT：
--删除SC表中元组时统计并显示被删除元组个数
--（1）创建触发器DEL_COUNT
USE JXGL
GO
	CREATE TRIGGER DEL_COUNT
	ON SC
	FOR
	DELETE
	AS
		DECLARE @COUNT VARCHAR(50)
		SELECT @COUNT=STR(@@ROWCOUNT)+'THE NUMBER OF STUDENT DELETED'
		SELECT @COUNT
GO