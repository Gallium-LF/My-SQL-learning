--触发器在技术实现层面上分为两类
--表记触发器--作用于特定关系表，如S_I_U，DEL_COUNT
--数据库触发器--作用于特定数据库中所有关系,如SAFTY
--触发器管理
--使用系统存储过程sp_helpext查看触发器 DEL_COUNT
USE JXGL
GO
    EXEC sp_helpext DEL_COUNT
GO
--sp_helpext查看源码

--修改触发器S_I_U:当对S表进行插入和修改数据时，自动给出提示修改错误的信息
USE JXGL
GO
    ALTER TRIGGER S_I_U
    ON S
    INSTEAD OF
        INSERT,UPDATE
    AS
        PRINT 'invalid inserting or updating'
GO

--删除触发器
USE JXGL
GO
    DROP TRIGGER S_I_U
GO

--禁止和启用触发器：禁用S表上所有触发器
--禁用
USE JXGL
GO   
    ALTER TABLE S
    DISABLE TRIGGER ALL--或者写特定触发器名称
GO
--启用
USE JXGL
GO  
    ALTER TABLE S
    ENABLE TRIGGER ALL--或者写特定触发器名称
GO