--数据库安全性的实现技术
--1.身份验证：首先登录名，然后用户
--2.角色授权：角色技术，授权机制
--上述安全性技术实现场景：服务器-用户机
--授权是针对特定数据库用户
--准备工作：对JXGL创建三个用户
--（1）创建登录名user1和对应的用户user1
GO
	EXEC sp_addlogin 'USER1','123456' --WITH JXGL
GO

USE JXGL
GO
	EXEC sp_grantdbaccess 'USER1','USER1'
GO
--（2）创建登录名user2和对应的用户user2
GO
	EXEC sp_addlogin 'USER2','123456' --WITH JXGL
GO

USE JXGL
GO
	EXEC sp_grantdbaccess 'USER2','USER2'
GO
--（3）创建登录名user3和对应的用户user3
GO
	EXEC sp_addlogin 'USER3','123456' --WITH JXGL
GO

USE JXGL
GO
	EXEC sp_grantdbaccess 'USER3','USER3'
GO

--创建和管理角色
--（1）创建角色ROLE1并将user1加入其中
USE JXGL
GO
	EXEC sp_addrole 'ROLE1'
GO
--（2）将user1加入到role1中
USE JXGL
GO
	EXEC sp_addrolemember 'ROLE1','USER1'
GO
--（3）将user2加入到role1中
USE JXGL
GO
	EXEC sp_addrolemember 'ROLE1','USER2'
GO
--（4）将user2移除出role1
USE JXGL
GO
	EXEC sp_droprolemember 'ROLE1','USER2'
GO
--（5）删除角色
--先删除角色中所有用户
USE JXGL
GO
	EXEC sp_droprolemember 'ROLE1','USER1'
GO
--然后删除角色本身
USE JXGL
GO
	EXEC sp_droprole 'ROLE1'
GO

--授权机制
--在授权场景中，角色和用户在技术实现属于同一层级
--public角色授权
--（1）将创建基本权限授予角色public
USE JXGL
GO
	GRANT CREATE TABLE
	TO public
GO

--（2）将给定权限授予public角色，但拒绝授予user2
USE JXGL
GO
	GRANT CREATE VIEW
	TO public
GO

GO
	DENY CREATE VIEW
	TO USER2
GO

--（3）撤销public角色创建视图的权限
USE JXGL
GO
	REVOKE CREATE TABLE
	FROM public
GO

--用户定义角色授权
--（1）将对S的查询权限授予role1
USE JXGL
GO
	GRANT SELECT ON S
	TO ROLE1
GO

--（2）撤销role关于S表的查询权限
USE JXGL
GO
	REVOKE SELECT ON S
	FROM ROLE1
GO