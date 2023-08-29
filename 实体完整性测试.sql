--一.实体完整性测试
--实体完整性规则(约束):主键必须非空且取值唯一
--在s表中插入('100002','PERTER','M',21,'CS')
USE JXGL
GO
    INSERT INTO S
    VALUES ('100002','PERTER','M',21,'CS')
GO
--运行结果:违反主键唯一性约束,系统报错

--在s表中修改100002号同学的学号为NULL
USE JXGL
GO
    UPDATE S
    SET SNO=NULL 
    WHERE SNO='100002'
GO
--运行结果:违反主键非空性约束,系统报错

--在s表中主键能否取'NULL'
USE JXGL
GO
    INSERT INTO S
    VALUES('NULL','PERTER','M',21,'CS')
GO
--运行结果:'NULL'作为字符串,不违反主键非空性约束

--主键可以取值'',系统将其作为单字符组成的字符串,不违反非空性约束
USE JXGL
GO
    INSERT INTO S
    VALUES('','PERTER','M',21,'CS')
GO
--说明:应用过程中,判断主键是否违反非空性约束,只看其是否取值为NULL,其余字符串都不违反非空性约束