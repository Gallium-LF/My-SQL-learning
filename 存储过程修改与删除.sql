--����ģ�飺���롢�����ģ�鹹��
--���ݿ��еĹ���ģ�飺
--1.������������ģ���������������ʽ�ģ�����������ģ�鹹�� ͨ���������ݸ���
--2.�洢���̣���������ʽ�ģ��������ʽ�ģ��������������루���������ʵ�ε��β����ݴ��ݣ�ͨ���������ݲ�ѯ
--3.�����������롢����͹��춼����ʽ�� ͨ�����ڸ��ӵ����ݴ���
--�洢����
--�洢���̹���
--1.�鿴�洢���̵Ļ�����Ϣ
USE JXGL
GO
	EXEC sp_helptext PV_GRADE--�鿴Դ��
GO
USE JXGL
GO
	EXEC sp_help PV_GRADE--�鿴���������Ϣ
GO
--2.�޸Ĵ洢����
USE JXGL
GO
	ALTER PROCEDURE PS_GRADE @S_NAME CHAR(8),@S_AVG REAL OUTPUT,@S_SUM INT OUTPUT
AS
	SELECT @S_AVG=AVG(GRADE),@S_SUM=SUM(GRADE)
	FROM S JOIN SC ON S.SNO=SC.SNO AND SNAME=@S_NAME
EXEC sp_help PS_GRADE
GO
--3.ɾ���洢����
USE JXGL
GO
	DROP PROCEDURE SC_GRADE
GO

--4.ʹ��ϵͳ�洢���̲鿴���ݿ������Ϣ
--�鿴�����ļ�
USE JXGL
GO
	EXEC sp_helpfile
GO
--�鿴���ݿ������Ϣ
EXEC sp_databases--�鿴���ݿ�
EXEC sp_tables--�鿴���ݱ�
EXEC sp_columns--�鿴������