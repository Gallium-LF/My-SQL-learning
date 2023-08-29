--存储过程
--创建存储过程
--创建存储过程SC_GRADE:输入同学学号和课程后，输出相应的成绩
USE JXGL
GO
    --存储过程声明
    CREATE PROCEDURE SC_GRADE
        @PAR_SNO CHAR(8),@PAR_CNO CHAR(4)
    --存储过程体
    AS
        BEGIN
            SET NOCOUNT ON;
            SELECT GRADE
            FROM SC
            WHERE SNO = @PAR_SNO AND CNO = @PAR_CNO
        END
GO
--调用
USE JXGL
GO  
    --存储过程调用
    --对应函数实参声明
    DECLARE @SSNO CHAR(8),@CCNO CHAR(4)
    --对应函数实参赋值
    SET @SSNO='100001'
    SET @CNO='C001'
    --对应函数调用语句
    EXEC SC_GRADE @SSNO,@CCNO
GO

--创建存储过程PS_GRADE:输出指定同学的姓名、课程信息和对应成绩
--创建
USE JXGL
GO
    CREATE PROCEDURE PS_GRADE
        @S_NAME CHAR(8)
    AS
        SELECT SNAME,CNAME,GRADE
        FROM S JOIN SC ON S.SNO=SC.SNO AND SNAME=@S_NAME JOIN C ON SC.CNO=C.CNO
GO
--调用
USE JXGL
GO
    DECLARE @NNAME CHAR(8)
    SET @NNAME='LINDA'
    EXEC PS_GRADE @NNAME
GO

--创建存储过程PV_GRADE:输入同学姓名后显示所修课程平均成绩
USE JXGL
GO
    CREATE PROCEDURE PV_GRADE
        @S_NAME CHAR(8),@S_AVG REAL OUTPUT
    AS
        SELECT @S_AVG=AVG(GRADE)
        FROM S JOIN SC ON S.SNO=SC.SNO AND SNAME=@S_NAME
GO
--调用
USE JXGL
GO
    DECLARE @S_AVG REAL
    EXEC PV_GRADE 'LINDA',@S_AVG OUTPUT
    PRINT 'LINDA的平均成绩：'+STR(@S_AVG)
GO