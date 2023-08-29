--一般笛卡尔乘积查询
USE JXGL
GO
	SELECT S$.*,SC$.*
	FROM S$,SC$
GO

--笛卡尔乘积->一般连接->sita连接->等值连接—>自然连接
--连接：等值连接
USE JXGL
GO
	SELECT S$.*,SC$.*
	FROM S$ INNER JOIN SC$ ON S$.SNO=SC$.SNO
GO

--自然连接
--没有提供独立的自然连接运算符
--连接运算中，唯一的属性列可以不带对应的表的前缀
USE JXGL
GO
	SELECT S$.*,SC$.CNO,SC$.GRADE
	FROM S$ INNER JOIN SC$ ON S$.SNO=SC$.SNO
GO

--基于WHERE子句的等值连接和自然连接
--(1)等值连接
USE JXGL
GO
	SELECT S$.*,SC$.*
	FROM S$,SC$
	WHERE S$.SNO=SC$.SNO
GO
--(2)自然连接
USE JXGL
GO
	SELECT S$.*,SC$.CNO,SC$.GRADE
	FROM S$,SC$
	WHERE S$.SNO=SC$.SNO
GO