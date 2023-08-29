--视图数据插入
--全属性数据插入
--插入数据符合视图限制条件
--无选项WIHT CHECK OPTION
USE JXGL
GO
	INSERT INTO S_MT1
	VALUES ('100016','LIU','M',19,'MT')
GO
---有选项WIHT CHECK OPTION
USE JXGL
GO
	INSERT INTO S_MT
	VALUES ('100017','ZHOU','F',20,'MT')
GO
--运行结果：满足限制条件时，有无“with check option”无差别
--视图与基本表都执行插入操作


--插入数据不符合视图限制条件
--无选项WIHT CHECK OPTION
USE JXGL
GO
	INSERT INTO S_MT1
	VALUES ('100020','ZHU','M',19,'IS')
GO
--运行结果：系统不报错，基本表执行插入，视图表不执行插入操作

---有选项WIHT CHECK OPTION
USE JXGL
GO
	INSERT INTO S_MT
	VALUES ('100025','WANG','F',20,'CS')
GO
--运行结果：不满足限制条件时，系统报错，基本表和视图都不执行插入操作