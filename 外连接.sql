--�����Ӳ�ѯ �������Ӳ�ͬ��������ͨ������from�Ӿ���ʵ�ֶ�����where�Ӿ�
--��ѯ�Ƿ�ѡ��c003�ſγ̵�ͬѧ��Ϣ���������ӣ�
USE JXGL
GO
	SELECT S$.*,CNO,GRADE
	FROM S$ LEFT JOIN SC$ ON S$.SNO=SC$.SNO AND SC$.CNO='C003'
GO

--��ѯ�Ƿ�ѡ��c003�ſγ̵�ͬѧ��Ϣ���������ӣ�
USE JXGL
GO
	SELECT S$.*,CNO,GRADE
	FROM S$ RIGHT JOIN SC$ ON S$.SNO=SC$.SNO AND SC$.CNO='C003'
GO

--��ѯ�Ƿ�ѡ��c003�ſγ̵�ͬѧ��Ϣ��ȫ�����ӣ�
USE JXGL
GO
	SELECT S$.*,CNO,GRADE
	FROM S$ FULL JOIN SC$ ON S$.SNO=SC$.SNO AND SC$.CNO='C003'
GO

--��ѯ�Ƿ�ѡ��c003�ſγ̵�ͬѧ��Ϣ��ȫ�����ӣ�
USE JXGL
GO
	SELECT S$.*,CNO,GRADE
	FROM S$ INNER JOIN SC$ ON S$.SNO=SC$.SNO AND SC$.CNO='C003'
GO