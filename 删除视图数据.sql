--视图数据删除
--由于删除视图表中的整个元组，而视图表元组都满足限制条件，不会出现不符合限制条件的情况，所以有无选项对删除不影响
--无选项
USE JXGL
GO
	DELETE FROM S_MT1
	WHERE SNAME='HUANG'
GO

--有选项
USE JXGL
GO
	DELETE FROM S_MT
	WHERE SNAME='NIU'
GO