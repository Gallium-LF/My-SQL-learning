--��ѯÿλͬѧ�������Լ�ƽ���ɼ������пγ̲������Ԫ���ѧ�š��γ̺š��ɼ�
USE JXGL
GO
	SELECT SNO,CNO,GRADE
	FROM SC$ SC1
	WHERE GRADE>=
		(SELECT AVG(GRADE)
		 FROM SC$ SC2
		 WHERE SC1.SNO=SC2.SNO)
GO
--��ѯѡ����C003��ѧ������
USE JXGL
GO
	SELECT SNAME
	FROM S$
	WHERE EXISTS
		(SELECT *
		 FROM SC$
		 WHERE S$.SNO=SC$.SNO AND CNO='C003')
GO