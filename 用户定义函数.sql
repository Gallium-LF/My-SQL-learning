--�����ݿ����У�����ģ�飩����������ʽ�����������洢���̡��û����庯��
--�ڳ�������У���������Ҫ�㣺
--ʹ�ú�����Ҫ�أ���1������������2���������ã�3�����庯����
--����������Ҫ�أ���1������ֵ�������ͣ�2���������ƣ�3�������β�
--���ݿ⹦��ģ�鷵��ֵ�������ͣ�
--������ֵ��������SC����ƽ��ֵ�������Сֵ��������
--���ر�ֵ��һ����ԣ�SELECT������һ�����

--��������ֵ����
--������ֵ����S_AVG������һ��ͬѧ�������ظ�ͬѧƽ���ɼ�
USE JXGL
GO
	--S_AVG����
	CREATE FUNCTION S_AVG(@S_NAME CHAR(8))--���������β�
	RETURNS REAL --��������ֵ
	AS
	BEGIN
		DECLARE @s_AVERAGE REAL
		SELECT @s_AVERAGE = AVG(GRADE)
		FROM S JOIN SC ON S.SNO=SC.SNO AND S.SNAME=@S_NAME
		RETURN @s_AVERAGE
	END
GO
--��������
USE JXGL
GO
	PRINT dbo.S_AVG('Linda')
GO

--����ֵ�����������﷨��ʽ
--CREATE FUNCTION <��������>���βΣ�
--RETURNS <��������>
--AS
--BEGIN
--	<SQL���>|<����ģ��>
--	RETURN <@����>
--END

--��ֵ����
--������ֵ����S_CNAME:����һ��ͬѧѧ�ź󣬷��ظ�ͬѧ��ѡ�����пγ�����
USE JXGL
GO
	CREATE FUNCTION S_CNAME(@S_NO CHAR(8))
	RETURNS TABLE--����ֵΪ������
	AS
		RETURN(
			SELECT SNO,CNAME
			FROM SC JOIN C ON SC.CNO=C.CNO AND SNO=@S_NO
		)
GO
--����
USE JXGL
GO
	SELECT *
	FROM S_CNAME('100005')
GO

--������ֵ����
--����������ֵ����S_TABLE������һ��ͬѧ�����󣬷��ظ�ͬѧ�ɼ���
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
--����
USE JXGL
GO
	SELECT*
	FROM S_TABLE('Linda')
GO

--������
--�鿴����
USE JXGL
GO
	EXEC sp_help S_TABLE
GO
--�޸ĺ���
ALTER FUNCTION<������>(@�β�)
RETURNS<��������>
AS
BEGIN
	<SQL���>|<����ģ��>
	RETURN <@����>
END

--ɾ������
USE JXGL
GO
	DROP S_AVG
GO