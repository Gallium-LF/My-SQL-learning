--��ͼ���ݵĸ���
--����������ͼ�����Ը�������
--��1��������ʽ��ͼ���Ը���
--��2���ɶ���������ͼ�����ߴ��������ɾۼ���������������õ����򲻿ɸ���
--������ʽ��ͼ��������ͼ�û������ǵ����ұ��������������
--Ϊ��ͼS_MT����Ԫ��('100000','WANG','M',21,'MT')
--USE JXGL
--GO
--	INSERT INTO S_MT
--	VALUES ('100000','WANG','M',21,'MT')
--GO

--SELECT *
--FROM S_MT
--��ͼ����ʵ�����Ƕ���Ӧ�Ļ�����ĸ���

--Ϊ��ͼS_MT_AGE����Ԫ��('100051','ZHAO',21)
--USE JXGL
--GO
--	INSERT INTO S_MT_AGE
--	VALUES ('100051','ZHAO',21)
--GO

--SELECT *
--FROM S_MT_AGE

--����һ��������WITH CHECK OPTION��ͼS_MT1��Ϊ��ͼS_MT_AGE����Ԫ��('100051','ZHAO',21)
--USE JXGL
--GO
--	CREATE VIEW S_MT1
--	AS
--	SELECT *
--	FROM S
--	WHERE SDPET='MT'
--GO
	INSERT INTO S_MT1 (SNO,SNAME,AGE)
	VALUES ('100051','ZHAO',21)

SELECT *
FROM S_MT1