--ɾ��������
--DELETE
--FROM<����>
--[WHERE<�߼����ʽ>]
--ɾ������Ԫ��
USE JXGL
GO
	DELETE FROM S$
	WHERE SNO='100002' 
GO

--ɾ�����Ԫ��
USE JXGL
GO
	DELETE FROM S$
	WHERE SNO='100002' OR SNO='100041' OR SNO='100042' 
GO

--�����Ӳ�ѯ��ɾ������
USE JXGL
GO
	DELETE FROM S$
	WHERE SNO IN
	(
		SELECT SNO
		FROM S$
		WHERE SDPET='M'
	)
GO