--����ģ�飺���롢�����ģ�鹹��
--���ݿ��еĹ���ģ�飺
--1.������������ģ���������������ʽ�ģ�����������ģ�鹹�� ͨ���������ݸ���
--2.�洢���̣���������ʽ�ģ��������ʽ�ģ��������������루���������ʵ�ε��β����ݴ��ݣ�ͨ���������ݲ�ѯ
--3.�����������롢����͹��춼����ʽ�� ͨ�����ڸ��ӵ����ݴ���
--���̿������
--ѡ�����������
--IF_ELSE���
--��jxgl�У����C004ƽ���ɼ�������80�֣����롰C004�γ�ƽ���ɼ��������⡱
--���������C004�γ̵�ƽ���ɼ�����ˮ����
USE JXGL
GO
	IF(SELECT AVG(GRADE)
		FROM SC
		WHERE CNO='C004'
		)>=80
		PRINT'C004�γ�ƽ���ɼ���������'
		ELSE
		PRINT'C004�γ̵�ƽ���ɼ�����ˮ��'
GO

--CASE���
--��JXGL�У����ͬѧ����������ϵ��������
USE JXGL
GO
	SELECT SNAME AS '����'
		CASE SDEPT
			WHEN 'CS' THEN '�������ѧϵ'
			WHEN 'IS' THEN '��Ϣ��ѧϵ'
			WHEN 'MT' THEN '��ѧϵ'
		END AS 'Ժϵ'
		--WHERE SNAME='BROOK'
GO
--�ɼ��ȼ�
USE JXGL
GO
	SELECT SNAME AS '����'
		CASE 
			WHEN GRADE>=90 THEN 'PREFECT'
			WHEN GRADE>=60 THEN 'GOOD'
			WHEN GRADE<60 THEN 'FAIL'
		END AS '�ɼ��ȼ�'
		FROM S JOIN SC ON S.SNO=SC.SNO
		WHERE CNO='C004'
		--WHERE SNAME='BROOK'
GO

--WHILEѭ�����
--��jxgl�У�ѭ��ʹ��print������s����Ůͬѧ��Ϣ
USE JXGL
GO
	DECLARE @info VARCHAR(200)
	DECLARE @curs CURSOR
	SET @curs=CURSOR SCROLL DYNAMIC
	FOR 
		SELECT 'ѧ���ǣ�'+SNO,'�����ǣ�'+SNAME,'�Ա��ǣ�'+SEX,'�����ǣ�'+AGE
		FROM S
		WHERE SEX='F'
	OPEN @curs
	FETCH NEXT FROM @curs INTO @info
	WHILE(@@FETCH_STATUS=0)
		BEGIN 
			PRINT @info
			FETCH NEXT FROM @curs INTO @info
		END
GO