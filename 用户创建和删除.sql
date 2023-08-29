--数据库安全性技术分为两类：
--身份验证：登录名账户和用户账户
--角色权限：角色管理和权限管理 
--身份验证 从形式上考虑：windows身份验证和混合身份验证（windows和sql server）
--由于数据库共享性：非服务器的工作机访问服务器需要混合身份验证
--sql server身份验证实现技术主要是登录名和用户
--登录名：通过登录名访问服务器
--补充默认的Windows身份验证为混合身份验证（设置登录名和密码）
ALTER LOGIN sa ENABLE
GO
	ALTER LOGIN sa WITH PASSWORD = '2'
GO

--sql语句创建和删除登录名
GO
	CREATE LOGIN SUSAN WITH PASSWORD='2'
GO
--删除登录名
GO
	DROP LOGIN SUSAN
GO

--存储过程创建和管理登录名
--1.使用sp_addlogin创建登录名
GO
	EXEC sp_addlogin 'SUSAN','2'
GO

--2.使用sp_helplogins查看登录名
GO
	EXEC sp_helplogins 'SUSAN'
GO

--3.使用sp_helplogins查看所有登录名
GO
	EXEC sp_helplogins
GO
--4.使用sp_password修改登陆密码
GO
	EXEC sp_password '123456','736473'
GO
--5.使用sp_droplogin删除susan
GO
	EXEC sp_droplogin 'SUSAN'
GO

--用户：给定了登录名后需要数据库用户名才能访问相应的数据库
--现有登录名，在设置基于登录名的用户，用户之和一个数据库相关联
--如果一个登录名要访问不同数据库，需要基于该登录名为每一个数据库创建一个用户
--一个登录名相对于一个数据库只能创建一个用户

--创建和删除用户
USE JXGL
GO
	CREATE USER SUSAN_USER FOR LOGIN SUSAN
	WITH DEFAULT_SCHEMA=dbo --dbo:db owner
GO

--删除用户
GO
	DROP USER SUSAN_USER 
GO

--使用存储过程创建和管理用户
--创建基于三个登录名的三个用户
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