--功能模块：输入、输出、模块构造
--数据库中的功能模块：
--1.触发器：功能模块的输入和输出是隐式的，其基本点就是模块构造 通常用于数据更新
--2.存储过程：输入是显式的，输出是隐式的，其基本点就是输入（定义参数和实参到形参数据传递）通常用于数据查询
--3.函数：其输入、输出和构造都是显式的 通常用于复杂的数据处理
--流程控制语句
--选择（条件）语句
--IF_ELSE语句
--在jxgl中，如果C004平均成绩不低于80分，输入“C004课程平均成绩令人满意”
--否则，输出“C004课程的平均成绩洒洒水啦”
USE JXGL
GO
	IF(SELECT AVG(GRADE)
		FROM SC
		WHERE CNO='C004'
		)>=80
		PRINT'C004课程平均成绩令人满意'
		ELSE
		PRINT'C004课程的平均成绩洒洒水啦'
GO

--CASE语句
--在JXGL中，输出同学姓名和所在系中文名称
USE JXGL
GO
	SELECT SNAME AS '姓名'
		CASE SDEPT
			WHEN 'CS' THEN '计算机科学系'
			WHEN 'IS' THEN '信息科学系'
			WHEN 'MT' THEN '数学系'
		END AS '院系'
		--WHERE SNAME='BROOK'
GO
--成绩等级
USE JXGL
GO
	SELECT SNAME AS '姓名'
		CASE 
			WHEN GRADE>=90 THEN 'PREFECT'
			WHEN GRADE>=60 THEN 'GOOD'
			WHEN GRADE<60 THEN 'FAIL'
		END AS '成绩等级'
		FROM S JOIN SC ON S.SNO=SC.SNO
		WHERE CNO='C004'
		--WHERE SNAME='BROOK'
GO

--WHILE循环语句
--在jxgl中，循环使用print语句输出s表中女同学信息
USE JXGL
GO
	DECLARE @info VARCHAR(200)
	DECLARE @curs CURSOR
	SET @curs=CURSOR SCROLL DYNAMIC
	FOR 
		SELECT '学号是：'+SNO,'姓名是：'+SNAME,'性别是：'+SEX,'年龄是：'+AGE
		FROM S
		WHERE SEX='F'
	OPEN @curs
	FETCH NEXT FROM @curs INTO @info
	WHILE(@@FETCH_STATUS=0)
		BEGIN 
			PRINT @info
			FETCH NEXT FROM @curs INTO @info
		END
GO