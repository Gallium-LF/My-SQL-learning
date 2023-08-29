--视图数据修改
--修改不涉及限制条件，无论有无选项，视图和基本表都执行相应修改操作
--无选项
USE JXGL
GO
	UPDATE S_MT1
	SET SNAME='HU'
	WHERE SNO='100023'
GO

--有选项
USE JXGL
GO
	UPDATE S_MT
	SET SNAME='NIU'
	WHERE SNO='100023'
GO

--修改涉及限制条件，无论有无选项，视图和基本表都执行相应修改操作
--无选项
USE JXGL
GO
	UPDATE S_MT1
	SET SDPET='IS'
	WHERE SNO='100023'
GO
--运行结果：不报错，基本表执行修改操作，视图删除修改后的元组

--有选项
USE JXGL
GO
	UPDATE S_MT
	SET SDPET='SHI'
	WHERE SNO='100023'
GO
--运行结果：系统报错，基本表和视图都不执行修改操作