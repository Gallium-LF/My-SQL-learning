--һ��ѿ����˻���ѯ
USE JXGL
GO
	SELECT S$.*,SC$.*
	FROM S$,SC$
GO

--�ѿ����˻�->һ������->sita����->��ֵ���ӡ�>��Ȼ����
--���ӣ���ֵ����
USE JXGL
GO
	SELECT S$.*,SC$.*
	FROM S$ INNER JOIN SC$ ON S$.SNO=SC$.SNO
GO

--��Ȼ����
--û���ṩ��������Ȼ���������
--���������У�Ψһ�������п��Բ�����Ӧ�ı��ǰ׺
USE JXGL
GO
	SELECT S$.*,SC$.CNO,SC$.GRADE
	FROM S$ INNER JOIN SC$ ON S$.SNO=SC$.SNO
GO

--����WHERE�Ӿ�ĵ�ֵ���Ӻ���Ȼ����
--(1)��ֵ����
USE JXGL
GO
	SELECT S$.*,SC$.*
	FROM S$,SC$
	WHERE S$.SNO=SC$.SNO
GO
--(2)��Ȼ����
USE JXGL
GO
	SELECT S$.*,SC$.CNO,SC$.GRADE
	FROM S$,SC$
	WHERE S$.SNO=SC$.SNO
GO