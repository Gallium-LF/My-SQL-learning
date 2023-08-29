--���ݿⰲȫ�Լ�����Ϊ���ࣺ
--�����֤����¼���˻����û��˻�
--��ɫȨ�ޣ���ɫ�����Ȩ�޹��� 
--�����֤ ����ʽ�Ͽ��ǣ�windows�����֤�ͻ�������֤��windows��sql server��
--�������ݿ⹲���ԣ��Ƿ������Ĺ��������ʷ�������Ҫ��������֤
--sql server�����֤ʵ�ּ�����Ҫ�ǵ�¼�����û�
--��¼����ͨ����¼�����ʷ�����
--����Ĭ�ϵ�Windows�����֤Ϊ��������֤�����õ�¼�������룩
ALTER LOGIN sa ENABLE
GO
	ALTER LOGIN sa WITH PASSWORD = '2'
GO

--sql��䴴����ɾ����¼��
GO
	CREATE LOGIN SUSAN WITH PASSWORD='2'
GO
--ɾ����¼��
GO
	DROP LOGIN SUSAN
GO

--�洢���̴����͹����¼��
--1.ʹ��sp_addlogin������¼��
GO
	EXEC sp_addlogin 'SUSAN','2'
GO

--2.ʹ��sp_helplogins�鿴��¼��
GO
	EXEC sp_helplogins 'SUSAN'
GO

--3.ʹ��sp_helplogins�鿴���е�¼��
GO
	EXEC sp_helplogins
GO
--4.ʹ��sp_password�޸ĵ�½����
GO
	EXEC sp_password '123456','736473'
GO
--5.ʹ��sp_droploginɾ��susan
GO
	EXEC sp_droplogin 'SUSAN'
GO

--�û��������˵�¼������Ҫ���ݿ��û������ܷ�����Ӧ�����ݿ�
--���е�¼���������û��ڵ�¼�����û����û�֮��һ�����ݿ������
--���һ����¼��Ҫ���ʲ�ͬ���ݿ⣬��Ҫ���ڸõ�¼��Ϊÿһ�����ݿⴴ��һ���û�
--һ����¼�������һ�����ݿ�ֻ�ܴ���һ���û�

--������ɾ���û�
USE JXGL
GO
	CREATE USER SUSAN_USER FOR LOGIN SUSAN
	WITH DEFAULT_SCHEMA=dbo --dbo:db owner
GO

--ɾ���û�
GO
	DROP USER SUSAN_USER 
GO

--ʹ�ô洢���̴����͹����û�
--��������������¼���������û�
GO
	EXEC sp_addlogin 'USER1','123456'
GO
USE JXGL
GO
	EXEC sp_grantdbaccess 'USER1','USER1'
GO

GO
	EXEC sp_addlogin 'USER2','123456'
GO
USE JXGL
GO
	EXEC sp_grantdbaccess 'USER2','USER2'
GO

GO
	EXEC sp_addlogin 'USER3','123456'
GO
USE JXGL
GO
	EXEC sp_grantdbaccess 'USER3','USER3'
GO