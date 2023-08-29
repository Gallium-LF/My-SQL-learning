--���ݿⰲȫ�Լ�����������֤����Ȩ����
--��Ȩ���ƣ�PUBLIC��ɫ��Ȩ���û������ɫ��Ȩ���û�ֱ����Ȩ
--PUBLIC��ɫ��deny����
--ֱ����Ȩ�û�
--��1������user1��s���ϵ�updateȨ��
USE JXGL
GO
	GRANT UPDATE 
	ON S
	TO USER1
GO
--��2������user1��S���ϵ�updateȨ��
USE JXGL
GO
	REVOKE UPDATE 
	ON S
	FROM USER1
GO
--��3������user2��c���ϵ�select���������䴫��
USE JXGL
GO
	GRANT SELECT
	ON C
	TO USER2
	WITH GRANT OPTION--�����䴫��
GO
--��4������user2��c���ϵ�selectȨ��
--���ջ�user2����Ȩ��
USE JXGL
GO
	REVOKE SELECT
	ON C
	FROM USER2
GO
--�ش���·���ջ�Ȩ��
USE JXGL
GO
	REVOKE SELECT
	ON C
	FROM USER2 CASCADE
GO
--ʹ�ô洢����sp_helprotect�鿴������Ȩ��
--��1����ȱʡ�鿴
USE JXGL
GO
	EXEC sp_helprotect 'C'
GO
--��2��ȱʡ�鿴
USE JXGL
GO
	EXEC sp_helprotect NULL,NULL,NULL,'C'
GO