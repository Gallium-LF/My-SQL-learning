--���ݿⰲȫ�Ե�ʵ�ּ���
--1.�����֤�����ȵ�¼����Ȼ���û�
--2.��ɫ��Ȩ����ɫ��������Ȩ����
--������ȫ�Լ���ʵ�ֳ�����������-�û���
--��Ȩ������ض����ݿ��û�
--׼����������JXGL���������û�
--��1��������¼��user1�Ͷ�Ӧ���û�user1
GO
	EXEC sp_addlogin 'USER1','123456' --WITH JXGL
GO

USE JXGL
GO
	EXEC sp_grantdbaccess 'USER1','USER1'
GO
--��2��������¼��user2�Ͷ�Ӧ���û�user2
GO
	EXEC sp_addlogin 'USER2','123456' --WITH JXGL
GO

USE JXGL
GO
	EXEC sp_grantdbaccess 'USER2','USER2'
GO
--��3��������¼��user3�Ͷ�Ӧ���û�user3
GO
	EXEC sp_addlogin 'USER3','123456' --WITH JXGL
GO

USE JXGL
GO
	EXEC sp_grantdbaccess 'USER3','USER3'
GO

--�����͹����ɫ
--��1��������ɫROLE1����user1��������
USE JXGL
GO
	EXEC sp_addrole 'ROLE1'
GO
--��2����user1���뵽role1��
USE JXGL
GO
	EXEC sp_addrolemember 'ROLE1','USER1'
GO
--��3����user2���뵽role1��
USE JXGL
GO
	EXEC sp_addrolemember 'ROLE1','USER2'
GO
--��4����user2�Ƴ���role1
USE JXGL
GO
	EXEC sp_droprolemember 'ROLE1','USER2'
GO
--��5��ɾ����ɫ
--��ɾ����ɫ�������û�
USE JXGL
GO
	EXEC sp_droprolemember 'ROLE1','USER1'
GO
--Ȼ��ɾ����ɫ����
USE JXGL
GO
	EXEC sp_droprole 'ROLE1'
GO

--��Ȩ����
--����Ȩ�����У���ɫ���û��ڼ���ʵ������ͬһ�㼶
--public��ɫ��Ȩ
--��1������������Ȩ�������ɫpublic
USE JXGL
GO
	GRANT CREATE TABLE
	TO public
GO

--��2��������Ȩ������public��ɫ�����ܾ�����user2
USE JXGL
GO
	GRANT CREATE VIEW
	TO public
GO

GO
	DENY CREATE VIEW
	TO USER2
GO

--��3������public��ɫ������ͼ��Ȩ��
USE JXGL
GO
	REVOKE CREATE TABLE
	FROM public
GO

--�û������ɫ��Ȩ
--��1������S�Ĳ�ѯȨ������role1
USE JXGL
GO
	GRANT SELECT ON S
	TO ROLE1
GO

--��2������role����S��Ĳ�ѯȨ��
USE JXGL
GO
	REVOKE SELECT ON S
	FROM ROLE1
GO