--在数据库编程中（功能模块），有三种形式：触发器、存储过程、用户定义函数
--在程序设计中，函数基本要点：
--使用函数三要素：（1）函数声明（2）函数调用（3）定义函数体
--函数声明三要素：（1）返回值数据类型（2）函数名称（3）函数形参
--数据库功能模块返回值两种类型：
--返回数值：例如在SC表返回平均值，最大最小值，总数等
--返回表值：一般而言，SELECT语句就是一个表格

--数（量）值函数
--创建数值函数S_AVG：输入一个同学名，返回该同学平均成绩
USE JXGL
GO
	--S_AVG声明
	CREATE FUNCTION S_AVG(@S_NAME CHAR(8))--函数名与形参
	RETURNS REAL --函数返回值
	AS
	BEGIN
		DECLARE @s_AVERAGE REAL
		SELECT @s_AVERAGE = AVG(GRADE)
		FROM S JOIN SC ON S.SNO=SC.SNO AND S.SNAME=@S_NAME
		RETURN @s_AVERAGE
	END
GO
--函数调用
USE JXGL
GO
	PRINT dbo.S_AVG('Linda')
GO

--标量值函数创建的语法格式
--CREATE FUNCTION <函数名称>（形参）
--RETURNS <数据类型>
--AS
--BEGIN
--	<SQL语句>|<功能模块>
--	RETURN <@变量>
--END

--表值函数
--创建表值函数S_CNAME:输入一个同学学号后，返回该同学所选修所有课程名称
USE JXGL
GO
	CREATE FUNCTION S_CNAME(@S_NO CHAR(8))
	RETURNS TABLE--返回值为表类型
	AS
		RETURN(
			SELECT SNO,CNAME
			FROM SC JOIN C ON SC.CNO=C.CNO AND SNO=@S_NO
		)
GO
--调用
USE JXGL
GO
	SELECT *
	FROM S_CNAME('100005')
GO

--多语句表值函数
--创建多语句表值函数S_TABLE：输入一个同学姓名后，返回该同学成绩表
USE JXGL
GO
	CREATE FUNCTION S_TABLE(@S_NAME CHAR(8))
	RETURNS @TB TABLE(
		TB_NO CHAR(9),
		TB_NAME CHAR(8),
		TB_CNO CHAR(4),
		TB_GRADE REAL
	)
	AS
	BEGIN
		INSERT INTO @TB
		SELECT S.SNO,SNAME,CNO,GRADE
		FROM S JOIN SC ON S.SNO=SC.SNO
		WHERE SNAME=@S_NAME
		RETURN
	END
GO	
--调用
USE JXGL
GO
	SELECT*
	FROM S_TABLE('Linda')
GO

--管理函数
--查看函数
USE JXGL
GO
	EXEC sp_help S_TABLE
GO
--修改函数
ALTER FUNCTION<函数名>(@形参)
RETURNS<数据类型>
AS
BEGIN
	<SQL语句>|<功能模块>
	RETURN <@变量>
END

--删除函数
USE JXGL
GO
	DROP S_AVG
GO