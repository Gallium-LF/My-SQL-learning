--一.非空唯一性约束(属性列级约束):NOT NULL,UNIQUE
--空值是默认的,null可写可不写
--在创建关系表时候定义
--通常是列级完整性约束,不需要再添加需要约束的属性列名
--如果对于某个属性添加主键约束,相应列后可以不添加not null 和 unique
--USE JXGL
--GO
--    CREATE TABLE SC1(
--        SNO CHAR(9) NOT NULL UNIQUE,
--        CNO CHAR(8) NOT NULL,
--        GRADE SMALLINT UNIQUE,
--		PRIMARY KEY (SNO,CNO)
--    )
--GO

--二.CHECK约束
--语法格式:CHECK(一般的谓词公式)
--一般谓词公式的三种形式:关系运算式,逻辑运算式,谓词运算式;
--通常也是只在创建关系表简历check约束
--关系运算式
--由于check约束既是列级约束,又是表级约束,因此,表达式中需要指明限制的属性名
USE JXGL
GO
    CREATE TABLE S1(
        SNO CHAR(9),
        SNAME CHAR(8),
		SEX CHAR(2),
		AGE SMALLINT CHECK(AGE<=35),
		SDEPT CHAR(20)
    )
GO

--逻辑运算式
USE JXGL
GO
    CREATE TABLE SC2(
        SNO CHAR(9),
        CNO CHAR(8),
        GRADE SMALLINT --CHECK(BETWEEN 0 AND 100)--列级约束,
		CHECK(GRADE>=0 AND GRADE<=100)--表级约束
    )
GO

--谓词运算式
USE JXGL
GO
    CREATE TABLE S1(
        SNO CHAR(9),
        SNAME CHAR(8),
		SEX CHAR(2),
		AGE SMALLINT CHECK(AGE<=35),
		SDEPT CHAR(20),
		CHECK(SEX IN ('M','F'))--表级约束
    )
GO

--三.constraint约束
--为了有效管理check约束,需要给其引入标识,将其当作一个"独立对象"处理
--语法格式:CONSTRAINT<约束名>CHECK子句
--CONSTRAINT约束在创建表的时候建立
USE JXGL
GO
	CREATE TABLE T(
	TNO CHAR(10),
	TNAME CHAR(8),
	SEX CHAR(2),
	AGE SMALLINT,
	TSALARY REAL,
	TDEPT CHAR(4),
	CONSTRAINT TU1 CHECK (SEX IN ('M','F')),
	CONSTRAINT TU2 CHECK (TSALARY BETWEEN 10000 AND 30000),
	CONSTRAINT TU3 PRIMARY KEY (TNO)
	)
GO

--查看约束
EXEC sp_helptext 'TU1'
EXEC sp_helptext 'TU2'

--删除约束
USE JXGL
GO
	ALTER TABLE T
	DROP TU1
GO

--添加约束
USE JXGL
GO
	ALTER TABLE T
	ADD CONSTRAINT TU1 CHECK(SEX IN ('M','F'))
GO

--四.rule约束
--RULE约束是跨表约束
--创建规则约束
USE JXGL
GO
	CREATE RULE GENDER_RULE AS @VALUE IN('M','F')
GO
--1.绑定到给定表的给定属性
EXEC sp_bindrule GENDER_RULE,'T.[SEX]'
EXEC sp_bindrule GENDER_RULE,'S1.[SEX]'

