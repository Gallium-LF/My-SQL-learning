--��ͼ�Ĵ���
--������ͼ�﷨��ʽ
--CREATE VIEW <��ͼ����> (<��������>,[2,...,n])
--AS
--(SELECT ��ѯ���)
--[WITH CHECK OPTION]

--����1��ʹ�û�����ȫ����
--������ѧϵͬѧ��ͼS_MT
--USE JXGL
--GO
--	CREATE VIEW S_MT
--	AS
--	SELECT *
--	FROM S
--	WHERE SDPET='MT'
--	WITH CHECK OPTION--�����ֻ�Կɸ�����ͼ����ʹ��
--GO

--SELECT *
--FROM S_MT

--����2��ʹ�û�����������
--������ѧϵͬѧ��ͼS_MT_AGE
--USE JXGL
--GO
--	CREATE VIEW S_MT_AGE (SNO,SNAME,AGE)
--	AS
--	SELECT SNO,SNAME,AGE
--	FROM S
--	WHERE SDPET='MT'
--	WITH CHECK OPTION--�����ֻ�Կɸ�����ͼ����ʹ��
--GO

--SELECT *
--FROM S_MT_AGE

--����3��ʹ�û�������ʽ����
--����ͬѧ����ѡ�޿γ̵���������Ӧƽ���ɼ�
--USE JXGL
--GO
--	CREATE VIEW C_G (SNO,C_NUM,AVG_GRADE)
--	AS
--	SELECT SNO,COUNT(CNO),AVG(GRADE)
--	FROM SC
--  WHERE GRADE IS NOT NULL
--	GROUP BY SNO
--GO

--SELECT *
--FROM C_G
