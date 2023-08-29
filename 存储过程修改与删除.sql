--功能模块：输入、输出、模块构造
--数据库中的功能模块：
--1.触发器：功能模块的输入和输出是隐式的，其基本点就是模块构造 通常用于数据更新
--2.存储过程：输入是显式的，输出是隐式的，其基本点就是输入（定义参数和实参到形参数据传递）通常用于数据查询
--3.函数：其输入、输出和构造都是显式的 通常用于复杂的数据处理
--存储过程
--存储过程管理
--1.查看存储过程的基本信息
USE JXGL
GO
	EXEC sp_helptext PV_GRADE--查看源码
GO
USE JXGL
GO
	EXEC sp_help PV_GRADE--查看各类参数信息
GO
--2.修改存储过程
USE JXGL
GO
	ALTER PROCEDURE PS_GRADE @S_NAME CHAR(8),@S_AVG REAL OUTPUT,@S_SUM INT OUTPUT
AS
	SELECT @S_AVG=AVG(GRADE),@S_SUM=SUM(GRADE)
	FROM S JOIN SC ON S.SNO=SC.SNO AND SNAME=@S_NAME
EXEC sp_help PS_GRADE
GO
--3.删除存储过程
USE JXGL
GO
	DROP PROCEDURE SC_GRADE
GO

--4.使用系统存储过程查看数据库相关信息
--查看数据文件
USE JXGL
GO
	EXEC sp_helpfile
GO
--查看数据库对象信息
EXEC sp_databases--查看数据库
EXEC sp_tables--查看数据表
EXEC sp_columns--查看数据列