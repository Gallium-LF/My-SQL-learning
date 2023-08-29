--������
--��������һ������洢���̣����ڴ������Ӧ�ó����е����ݿ�������
--Ϊs����һ������������insert��updateʱ������ʾ
--��1������������
USE JXGL
GO
	CREATE TRIGGER S_I_U
	ON S
	FOR 
	INSERT,UPDATE
	AS
		PRINT'inserted or updated for table S'
GO
--��2�����Դ�����
USE JXGL
GO
	UPDATE S
	SET SNAME='BROOK'
	WHERE SNO='100002'
GO
--���ݿ⼶��������ΪJXGL����һ�������������û��������ݿ��б�ɾ��ʱ���н�ֹɾ����ʾ
--ͬʱ���ع���ɾ����Ĳ���ʼ��
--��1������������SAFETY
USE JXGL
GO
	CREATE TRIGGER SAFETY
	ON DATABASE --SAFETY�����ݿ⼶������
	AFTER 
	DROP_TABLE
	AS 
		PRINT 'NO DELETING THE TABLE'
		ROLLBACK TRANSACTION
GO
--��2�����Դ�����
USE JXGL
GO
	DROP TABLE SC
GO
--Ϊs����һ��delete���ʹ�����DEL_COUNT��
--ɾ��SC����Ԫ��ʱͳ�Ʋ���ʾ��ɾ��Ԫ�����
--��1������������DEL_COUNT
USE JXGL
GO
	CREATE TRIGGER DEL_COUNT
	ON SC
	FOR
	DELETE
	AS
		DECLARE @COUNT VARCHAR(50)
		SELECT @COUNT=STR(@@ROWCOUNT)+'THE NUMBER OF STUDENT DELETED'
		SELECT @COUNT
GO