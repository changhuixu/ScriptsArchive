DECLARE @CurrentDate as datetime2(7);
SET @CurrentDate = GETDATE();
DECLARE @CurrentUser as nvarchar(30);
SET @CurrentUser = (SELECT TOP 1 nt_username FROM sys.sysprocesses WHERE spid = @@SPID);
DECLARE @OriginalID as nvarchar(30);
DECLARE @NewContactID as nvarchar(30);
--- Edit the parameters here
SET @OriginalID = 'old-id';
SET @NewContactID = 'new-id'

--- Check Print Orders created by the original ID
DECLARE @Id int;
SELECT ID INTO #PrintTemp FROM [dbo].[PrintOrders] WHERE CreatedBy = @OriginalID;
WHILE EXISTS(SELECT * FROM #PrintTemp)
BEGIN
    SELECT TOP 1 @Id = Id From #PrintTemp;

    INSERT INTO [dbo].[AdditionalContacts]
	([PrintOrderId],[ContactID],[Email],[CreatedBy],[CreatedOn])
	VALUES
	(@Id,@NewContactID,@NewContactEmail,@CurrentUser,@CurrentDate)

    Delete #PrintTemp Where Id = @Id;
END
