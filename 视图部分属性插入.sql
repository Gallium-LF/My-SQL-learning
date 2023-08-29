--部分属性数据视图插入
--部分属性满足限制条件
--无选项
USE JXGL
GO
	INSERT INTO S_MT1(SNO,SNAME,SEX,SDPET)
	VALUES ('100023','MA','M','MT')
GO

--有选项
USE JXGL
GO
	INSERT INTO S_MT(SNO,SNAME,SEX,SDPET)
	VALUES ('100024','HUANG','M','MT')
GO
--运行结果：符合视图限制条件，有无选项不影响操作

--不符合视图限制条件
--缺失限制条件
--无选项
USE JXGL
GO
	INSERT INTO S_MT1(SNO,SNAME,SEX)
	VALUES ('100025','MA','M')
GO

--有选项
USE JXGL
GO
	INSERT INTO S_MT(SNO,SNAME,SEX)
	VALUES ('100026','HUANG','M')
GO

--运行结果：在部分属性数据插入时，缺失限制条件，系统报错，基本表和视图都不执行插入操作

--限制条件属性值不符合要求
--无选项
USE JXGL
GO
	INSERT INTO S_MT1(SNO,SNAME,SEX,SDPET)
	VALUES ('100023','MA','M','IS')
GO
--运行结果：不报错，基本表执行插入，视图表不执行插入

--有选项
USE JXGL
GO
	INSERT INTO S_MT(SNO,SNAME,SEX,SDPET)
	VALUES ('100024','HUANG','M','CS')
GO
--运行结果：报错，基本表和视图表不执行插入

--基本结论：
--若存在视图产生属性的情况下，当符合限制条件时，有无选项不影响插入结果
--若存在视图产生属性的情况下，当不符合限制条件时：
--（1）无选项时，不报错，基本表执行插入，视图表不执行插入
--（2）有选项时，报错，基本表和视图表不执行插入
--若不存在视图产生属性的情况下，无论有无限制条件，都报错，不执行插入