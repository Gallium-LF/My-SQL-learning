--�޸ı�����
--UPDATE<����>
--SET <����>=<���ʽ>[��������n]
--[WHERE<�߼����ʽ>]
--�޸ĵ���Ԫ��
USE JXGL
GO
	UPDATE S$
	SET SNAME='PEETER',AGE=21
	WHERE SNO='100002'
GO

--�޸Ķ��Ԫ��
USE JXGL
GO
	UPDATE S$
	SET AGE=AGE+1
	WHERE SDPET='MT'
GO

--�����Ӳ�ѯ���޸Ĳ���
USE JXGL
GO
	UPDATE SC$
	SET GRADE=0
	WHERE SNO IN
		(
			SELECT SNO
			FROM S$
			WHERE SDPET='MT'
		)
GO