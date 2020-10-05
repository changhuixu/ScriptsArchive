-- Use admin account to run the following

GRANT SELECT ON SCHEMA::[dbo] TO [IOWA\ACL_Sql_Write];
GO
GRANT INSERT ON SCHEMA::[dbo] TO [IOWA\ACL_Sql_Write];
GO
GRANT UPDATE ON SCHEMA::[dbo] TO [IOWA\ACL_Sql_Write];
GO
GRANT DELETE ON SCHEMA::[dbo] TO [IOWA\ACL_Sql_Write];
GO

GRANT SELECT ON SCHEMA::[Hangfire] TO [IOWA\ACL_Sql_Write];
GO
GRANT INSERT ON SCHEMA::[Hangfire] TO [IOWA\ACL_Sql_Write];
GO
GRANT UPDATE ON SCHEMA::[Hangfire] TO [IOWA\ACL_Sql_Write];
GO
GRANT DELETE ON SCHEMA::[Hangfire] TO [IOWA\ACL_Sql_Write];
GO

-- when you create a new schema, be sure you set the owner to [dbo]
CREATE SCHEMA [dbo] AUTHORIZATION [dbo]
CREATE SCHEMA [HangFire] AUTHORIZATION [dbo]