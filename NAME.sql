USE kymonline
GO

CREATE TABLE dbo.AnalisisMaster
	(
	Division        NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Section         NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Department      NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Barcode         NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StandardBarcode NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	productname     NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Brand           NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	weight          NVARCHAR (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MRP_SPE         FLOAT NULL,
	MRP_List        FLOAT NULL,
	SaleQtySum      FLOAT NULL,
	StockQtySum     FLOAT NULL
	)
GO

CREATE TABLE dbo.tblAccount
	(
	Accopuntid     BIGINT IDENTITY NOT NULL,
	AccountName    NVARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DisplayName    NVARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	GroupName      NVARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	OpeningBalance DECIMAL (18, 2) NULL,
	BalanceType    NVARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ClosingBalance DECIMAL (18, 2) NULL,
	bitIsActive    BIT CONSTRAINT DF_tblAccount_bitIsActive DEFAULT ((1)) NULL,
	dateCreated    DATETIME CONSTRAINT DF_tblAccount_dateCreated DEFAULT (getdate()) NULL,
	bitIsDelete    BIT CONSTRAINT DF_tblAccount_bitIsDelete DEFAULT ((0)) NULL,
	CONSTRAINT PK_tblAccount PRIMARY KEY (Accopuntid)
	)
GO

CREATE TABLE dbo.tblAccountMaster
	(
	accountid          BIGINT IDENTITY NOT NULL,
	accountName        NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	displayName        NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	groupName          VARCHAR (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	openingBalance     DECIMAL (18, 2) NULL,
	openingbalancetype NVARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	currentbalance     DECIMAL (18, 2) NULL,
	currentbalancetype VARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	imageurl           NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	detailType         NVARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	depreciation       DECIMAL (18, 2) NULL,
	profitSharing      DECIMAL (18, 2) NULL,
	taxType            NVARCHAR (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	taxClass           NVARCHAR (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	taxDirection       NVARCHAR (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cstNumber          NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	drugLicense        NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	vatnumber          NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	invoiceType        NVARCHAR (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	billType           NVARCHAR (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	creditLimit        DECIMAL (18, 2) NULL,
	creditDays         INT NULL,
	discount           NUMERIC (3, 2) NULL,
	contactPerson      NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	address            NVARCHAR (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	area               NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	city               NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	state              NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	hqId               NUMERIC (18) NULL,
	country            NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	pincode            NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	phone              NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fax                NVARCHAR (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	mobile             NVARCHAR (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contactMail        NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	orderMail          NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	chatid             NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	website            NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	regionalName       NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	regionalAddress    NVARCHAR (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	hold               CHAR (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	partyType          NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	bitIsActive        BIT CONSTRAINT DF_tblAccountMaster_bitIsActive DEFAULT ((1)) NULL,
	dateCreated        DATE CONSTRAINT DF_tblAccountMaster_dateCreated DEFAULT (getdate()) NULL,
	bitIsDelete        BIT CONSTRAINT DF_tblAccountMaster_bitIsDelete DEFAULT ((0)) NULL,
	CONSTRAINT PK_tblAccountMaster PRIMARY KEY (accountid)
	)
GO

CREATE TABLE dbo.tblAccountTransactions
	(
	accounttransactionId     BIGINT IDENTITY NOT NULL,
	transactionType          VARCHAR (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	transactionId            NUMERIC (18) NULL,
	dailytransactionId       NUMERIC (18) NULL,
	voucherNumber            NUMERIC (18) NULL,
	voucherDate              DATETIME NOT NULL,
	accountName              NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	openingBalance           DECIMAL (18, 2) NOT NULL,
	openingbalanceType       NVARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	transactionAmount        DECIMAL (18, 2) NOT NULL,
	transactionSide          NVARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	closingBalance           DECIMAL (18, 2) NOT NULL,
	closingBalancetype       NVARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	transactionTotal         DECIMAL (18, 2) NOT NULL,
	bankName                 NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS CONSTRAINT DF_tblAccountTransactions_bankName DEFAULT ('N/A') NULL,
	documentNumber           NVARCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	documentDate             DATETIME NULL,
	narration                NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	receiptNumber            NUMERIC (18) NULL,
	realisationDate          DATETIME NULL,
	transactionidbyType      NUMERIC (18) NULL,
	dailyTransactionidbytype NUMERIC (18) NULL,
	slipNo                   NUMERIC (18) NULL,
	bitIsActive              BIT CONSTRAINT DF_tblAccountTransactions_bitIsActive DEFAULT ((1)) NULL,
	dateCreated              DATE CONSTRAINT DF_tblAccountTransactions_dateCreated DEFAULT (getdate()) NULL,
	bitIsDelete              BIT CONSTRAINT DF_tblAccountTransactions_bitIsDelete DEFAULT ((0)) NULL,
	CONSTRAINT PK_tblAccountTransactions PRIMARY KEY (accounttransactionId)
	)
GO

CREATE TABLE dbo.tblAdverstige
	(
	intAdverstigeId         BIGINT IDENTITY NOT NULL,
	strAdverstigeName       NVARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	intAdverstigeLocationId INT NULL,
	strImage                NVARCHAR (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	bitIsActive             BIT CONSTRAINT DF_tblAdverstige_bitIsActive DEFAULT ((1)) NULL,
	dateCreated             DATETIME CONSTRAINT DF_tblAdverstige_dateCreated DEFAULT (getdate()) NULL,
	strUrl                  NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	intOrder                BIGINT NULL,
	CONSTRAINT PK_tblAdverstige PRIMARY KEY (intAdverstigeId)
	)
GO

CREATE TABLE dbo.tblAllergyMaster
	(
	allergyId   BIGINT IDENTITY NOT NULL,
	allergyName NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	remark      NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	bitIsActive BIT CONSTRAINT DF_tblAllergyMaster_bitIsActive DEFAULT ((1)) NULL,
	dateCreated DATETIME CONSTRAINT DF_tblAllergyMaster_dateCreated DEFAULT (getdate()) NULL,
	bitIsDelete BIT CONSTRAINT DF_tblAllergyMaster_bitIsDelete DEFAULT ((0)) NULL,
	CONSTRAINT PK_tblAllergyMaster PRIMARY KEY (allergyId)
	)
GO

CREATE TABLE dbo.tblBanner
	(
	intBannerId   BIGINT IDENTITY NOT NULL,
	strBannerName NVARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	strImage      NVARCHAR (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	bitIsActive   BIT CONSTRAINT DF_tblBanner_bitIsActive DEFAULT ((1)) NULL,
	dateCreated   DATETIME CONSTRAINT DF_tblBanner_dateCreated DEFAULT (getdate()) NULL,
	strUrl        NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	bitIsHome     BIT NULL,
	bitIsCart     BIT NULL,
	intOrder      INT NULL,
	CONSTRAINT PK_tblBanner PRIMARY KEY (intBannerId)
	)
GO

CREATE TABLE dbo.tblBillTypeMaster
	(
	billtypeId      NUMERIC (18) NOT NULL,
	billtypeName    CHAR (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	printMemo       CHAR (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cashMemo        CHAR (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	invoiceType     VARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	creditDays      NUMERIC (18) NULL,
	billDescription VARCHAR (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	startInvoiceno  NUMERIC (18) NULL,
	hold            CHAR (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	bitIsActive     BIT CONSTRAINT DF_tblBillTypeMaster_bitIsActive DEFAULT ((1)) NULL,
	dateCreated     DATE CONSTRAINT DF_tblBillTypeMaster_dateCreated DEFAULT (getdate()) NULL,
	bitIsDelete     BIT CONSTRAINT DF_tblBillTypeMaster_bitIsDelete DEFAULT ((0)) NULL,
	CONSTRAINT PK_tblBillTypeMaster PRIMARY KEY (billtypeId)
	)
GO

CREATE TABLE dbo.tblBrand
	(
	brandId     BIGINT IDENTITY NOT NULL,
	strName     NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	strDesc     NVARCHAR (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	strlogo     NVARCHAR (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	strUrl      NVARCHAR (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	bitIsActive BIT CONSTRAINT DF_tblBrand_bitIsActive DEFAULT ((1)) NULL,
	datecreated DATETIME CONSTRAINT DF_tblBrand_datecreated DEFAULT (getdate()) NULL,
	CONSTRAINT PK_tblBrand PRIMARY KEY (brandId)
	)
GO

CREATE VIEW [dbo].[RandomNewID]
AS
SELECT NEWID() AS [NewID]

GO

CREATE PROCEDURE [dbo].[AccountListAdmin]                          
 @Accopuntid bigint=0                  
AS                    
                     
BEGIN                     
                    
                    
if @Accopuntid=0                    
   begin          
   select * from dbo.tblAccount  where bitIsDelete=0        
   end                   
else                    
   begin              
        select * from dbo.tblAccount  where Accopuntid=@Accopuntid   and  bitIsDelete=0            
   end                        
                       
end

GO

-- =============================================              
-- Author: Dhaval Ghevariya             
-- Create date: 26-Sep-2016              
-- Description: Modify Vendor           
-- select * from    dbo.tblVender           
-- =============================================              
CREATE PROCEDURE [dbo].[AccountModify]                            
 @Accopuntid bigint=0,  
 @AccountName nvarchar(50)='',                           
 @DisplayName nvarchar(50)='',  
 @GroupName nvarchar(50)='',                                                                               
 @openbal decimal(18,2)=0.00,  
 @baltype nvarchar(50)='',                                                                                    
 @intRetVal int=0 output                      
AS                      
                       
BEGIN                       
                      
                      
if @Accopuntid=0                      
   begin                       
   if exists(select * from dbo.tblAccount where AccountName=@AccountName and bitIsDelete=0 )                      
begin                      
 set @intRetVal=0                      
end                      
                      
else                      
begin                      
  insert into dbo.tblAccount(AccountName,DisplayName,GroupName,OpeningBalance,BalanceType)                      
                       values(@AccountName,@DisplayName,@GroupName,@openbal,@baltype)                      
                        set @intRetVal=1                      
   end                      
   end                      
else                      
   begin                       
   update dbo.tblAccount set                       
                         AccountName=@AccountName 
                         ,DisplayName=@DisplayName
                         ,GroupName=@GroupName       
                        ,OpeningBalance=@openbal  
                        ,BalanceType=@baltype  
                                 
                        where Accopuntid=@Accopuntid                      
                         set @intRetVal=2                      
   end                          
                         
end

GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddReferralToUserAccount]
@JoinUserId bigint=0,
@Refcode nvarchar(50)
AS
BEGIN
	 
	SET NOCOUNT ON;

    
		declare @MainUserId as bigint
		
		set @MainUserId=(select top 1 bintUserId from dbo.tblUser where RefCode=@Refcode)
		
		if @MainUserId >0
		begin
			
			insert into dbo.tblReferUser(MainUserId,JoinUserid,Commission,joinDate,ComDone,DoneDate)
			values(@MainUserId,@JoinUserId,50,GETDATE(),0,Null)
		end
    
    
    
    
    
END

GO

-- =============================================
-- Author:		shrikant patel
-- Create date: 14/09/2012
-- Description:	banner List Admin
-- select * from tblAdverstige
-- =============================================
CREATE PROCEDURE  [dbo].[AdverstigeListAdmin]
@intAdverstigeId int=0
AS
BEGIN
	SET NOCOUNT ON;

	if @intAdverstigeId=0
	begin
		select * from tblAdverstige
	end
    else
    begin
		select * from tblAdverstige where intAdverstigeId=@intAdverstigeId
	end		
	
END

GO

-- =============================================
-- Author:		shrikant patel
-- Create date: 14/09/2012
-- Description:Front Side Adverstige Show
-- select * from tblAdverstige
-- =============================================
CREATE PROCEDURE  [dbo].[AdverstigeListFront]

AS
BEGIN
	SET NOCOUNT ON;

		select * from dbo.tblAdverstige where bitisActive=1
			
END

GO

-- =============================================
-- Author:		shrikant patel
-- Create date: 14/09/2012
-- Description:	banner Modify
-- select * from tblAdverstige
-- =============================================
CREATE PROCEDURE  [dbo].[AdverstigeModify]
@intAdverstigeId int=0,
@strAdverstigeName nvarchar(50)='',
@intAdverstigeLocationId int=0,
@strImage nvarchar(50)='',
@strUrl nvarchar(500)='',
@intOrder bigint=0
AS
BEGIN
	SET NOCOUNT ON;

	if @intAdverstigeId=0
	begin
		insert into tblAdverstige(strAdverstigeName,intAdverstigeLocationId,strImage,strUrl,intOrder) values(@strAdverstigeName,@intAdverstigeLocationId,@strImage,@strUrl,@intOrder)
	end
    else
    begin
		update tblAdverstige set
		strAdverstigeName=@strAdverstigeName,
		intAdverstigeLocationId=@intAdverstigeLocationId,
		strImage=@strImage,
		strUrl=@strUrl,
		intOrder=@intOrder where intAdverstigeId=@intAdverstigeId
	end		
	
END

GO

-- =============================================      
-- Author: Manish Ganatra     
-- Create date: 26-Sep-2016      
-- Description: Modify [AllergyListAdmin]             
-- =============================================      
create PROCEDURE [dbo].[AllergyListAdmin]                    
 @allergyid bigint=0            
AS              
               
BEGIN         
if @allergyid=0              
   begin    
   select * from dbo.tblAllergyMaster where  bitIsDelete=0  
   end             
else              
   begin        
        select * from dbo.tblAllergyMaster  where allergyId=@allergyid   and bitIsDelete=0                 
   end                  
                 
end

GO

-- =============================================      
-- Author: Manish Ganatra      
-- Create date: 26-Sep-2016      
-- Description: Modify  AllergyMaster    
-- select * from dbo.tblAllergyMaster      
-- =============================================      
CREATE PROCEDURE [dbo].[AllergyModify]                    
 @allergyid bigint=0,         
 @allergyname nvarchar(500)='',      
 @remark nvarchar(500)='',                                                                           
 @intRetVal int=0 output              
AS              
               
BEGIN               
              
              
if @allergyid=0              
   begin               
   if exists(select * from dbo.tblAllergyMaster where allergyName=@allergyname and bitIsDelete=0)              
begin              
 set @intRetVal=0              
end              
              
else              
begin              
  insert into dbo.tblAllergyMaster(allergyName,remark)              
                       values(@allergyname,@remark)              
                        set @intRetVal=1              
   end              
   end              
else              
   begin               
   update dbo.tblAllergyMaster set               
                         allergyName=@allergyname,    
                         remark=@remark              
                               
                        where allergyId=@allergyid               
                         set @intRetVal=2              
   end                  
                 
end

GO

-- =============================================
-- Author:		shrikant patel
-- Create date: 14/09/2012
-- Description:Front Side Banner Show
-- select * from tblBanner
-- =============================================
Create PROCEDURE  [dbo].[Banner1ListFront]

AS
BEGIN
	SET NOCOUNT ON;

		select top 1 * from tblBanner where bitIsActive=1
			
END

GO

-- =============================================
-- Author:		shrikant patel
-- Create date: 14/09/2012
-- Description:	banner List Admin
-- select * from tblBanner
-- =============================================
CREATE PROCEDURE  [dbo].[BannerListAdmin]
@intBannerId int=0
AS
BEGIN
	SET NOCOUNT ON;

	if @intBannerId=0
	begin
		select * from tblBanner
	end
    else
    begin
		select * from tblBanner where intBannerId=@intBannerId
	end		
	
END

GO

-- =============================================
-- Author:		shrikant patel
-- Create date: 14-Feb-2012
-- Description:	Get Url of Gallery Page
-- select * from tblGallery
-- =============================================
CREATE FUNCTION [dbo].[ChangeProductName] 
(
	@strCategoryName nvarchar(500) = ''
	 
)
RETURNS nvarchar(500)
AS
BEGIN

	DECLARE @strCategoryUrl nvarchar(600)

	set @strCategoryUrl = @strCategoryName
	
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'*','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'+','-')
	
	 
	
		
 
	RETURN @strCategoryUrl

END

GO

CREATE FUNCTION [dbo].[CountShippingchargeBySessionId]
(
	@sessionId nvarchar(50)=''
)
RETURNS decimal(18,2)
AS
BEGIN
	
	
	
	

	declare @shp as decimal(18,2)
	
	--set @shp = (select sum(intqty) from  dbo.tblShoppingCartDtl where bintShoppingCartId = (select top 1 bintShoppingCartId from dbo.tblShoppingCart where strSessionId=@sessionId))

	--set @shp = @shp * 50
	
	set @shp=0
	
	return @shp

END

GO

CREATE FUNCTION [dbo].[GenerateRandomPassword] ( @PasswordLength INT )
RETURNS VARCHAR(20)
AS
BEGIN


DECLARE @Password     VARCHAR(20)
DECLARE @ValidCharacters   VARCHAR(100)
DECLARE @PasswordIndex    INT
DECLARE @CharacterLocation   INT


SET @ValidCharacters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890'


SET @PasswordIndex = 1
SET @Password = ''


WHILE @PasswordIndex <= @PasswordLength
BEGIN
 SELECT @CharacterLocation = ABS(CAST(CAST([NewID] AS VARBINARY) AS INT)) % 
LEN(@ValidCharacters) + 1
 FROM [dbo].[RandomNewID]


 SET @Password = @Password + SUBSTRING(@ValidCharacters, @CharacterLocation, 1)


 SET @PasswordIndex = @PasswordIndex + 1
END


RETURN @Password


END

GO

-- =============================================
-- Author:		Shrikant Patel
-- Create date: 13/11/2013
-- Description:	
-- =============================================
Create FUNCTION [dbo].[getBrandNameById]
(
	@BrandId as bigint=0
)
RETURNS nvarchar(100)
AS
BEGIN
	 
	 declare @Name as nvarchar(100)

	set @Name=(select strName from dbo.tblBrand where brandId=@BrandId)

	RETURN @Name

END

GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION [dbo].[GetbrandProductCountByDept]
(
	@brand bigint=0,
	@DivId bigint=0
)
RETURNS bigint
AS
BEGIN
	
	
	declare @Count as bigint

	set @Count=(select count(*) from tblproduct where brandid=@brand and deptId=@DivId)

	return @Count

END

GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetbrandProductCountByDivison]
(
	@brand bigint=0,
	@DivId bigint=0
)
RETURNS bigint
AS
BEGIN
	
	
	declare @Count as bigint

	set @Count=(select count(*) from tblproduct where brandid=@brand and DivisionId=@DivId)

	 return @Count

END

GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION [dbo].[GetbrandProductCountBySection]
(
	@brand bigint=0,
	@DivId bigint=0
)
RETURNS bigint
AS
BEGIN
	
	
	declare @Count as bigint

	set @Count=(select count(*) from tblproduct where brandid=@brand and bintCategoryId=@DivId)

	return @Count

END

GO

-- =============================================
-- Author:		shrikant patel
-- Create date: 13-Nov-2013
-- Description:	
-- =============================================
Create FUNCTION [dbo].[getBrandUrl] 
(
	@strBrandName nvarchar(500) = '',
	@bintBrandId bigint = 0
)
RETURNS nvarchar(500)
AS
BEGIN

	DECLARE @strBrandUrl nvarchar(600)

	set @strBrandUrl = @strBrandName
	set @strBrandUrl = REPLACE(@strBrandUrl,' ','-')
	set @strBrandUrl = REPLACE(@strBrandUrl,'&','And')
	set @strBrandUrl = REPLACE(@strBrandUrl,'?','-')
	set @strBrandUrl = REPLACE(@strBrandUrl,'~','-')
	set @strBrandUrl = REPLACE(@strBrandUrl,'=','-')
	set @strBrandUrl = REPLACE(@strBrandUrl,'/','-')
	set @strBrandUrl = REPLACE(@strBrandUrl,'\','-')
	set @strBrandUrl = REPLACE(@strBrandUrl,'''','')
	set @strBrandUrl = REPLACE(@strBrandUrl,'"','')
	set @strBrandUrl = REPLACE(@strBrandUrl,'.','-')
	set @strBrandUrl = REPLACE(@strBrandUrl,',','-')
	set @strBrandUrl = REPLACE(@strBrandUrl,':','-')
		
	if @bintBrandId = 0
	begin
		while exists(select 1 from dbo.tblBrand where strUrl = @strBrandUrl)
		begin
			set @strBrandUrl = @strBrandUrl + '@' 
		end
	end
	else
	begin
		while exists(select 1 from tblBrand where strUrl = @strBrandUrl and brandId <> @bintBrandId)
		begin
			set @strBrandUrl = @strBrandUrl + '@' 
		end

	end

	RETURN @strBrandUrl

END

GO

-- =============================================
-- Author:		shrikant patel
-- Create date: 14-Feb-2012
-- Description:	Get Url of Gallery Page
-- select * from tblGallery
-- =============================================
Create FUNCTION [dbo].[getCategoryDisplayUrl] 
(
	@strCategoryName nvarchar(500) = '',
	@bintCategoryId bigint = 0
)
RETURNS nvarchar(500)
AS
BEGIN

	DECLARE @strCategoryUrl nvarchar(600)

	set @strCategoryUrl = @strCategoryName
	set @strCategoryUrl = REPLACE(@strCategoryUrl,' ','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'&','And')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'?','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'~','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'=','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'/','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'\','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'''','')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'"','')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,'.','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,',','-')
	set @strCategoryUrl = REPLACE(@strCategoryUrl,':','-')
		
	if @bintCategoryId = 0
	begin
		while exists(select 1 from dbo.tblCategory where DisplayUrl = @strCategoryUrl)
		begin
			set @strCategoryUrl = @strCategoryUrl + '@' 
		end
	end
	else
	begin
		while exists(select 1 from tblCategory where DisplayUrl = @strCategoryUrl and bintCategoryId <> @bintCategoryId)
		begin
			set @strCategoryUrl = @strCategoryUrl + '@' 
		end

	end

	RETURN @strCategoryUrl

END

GO

CREATE FUNCTION [dbo].[GetCategoryHierarchyName] 
(
	@CategoryId int = 0
)
RETURNS nvarchar(500)
AS
BEGIN
	DECLARE @strRetCatName nvarchar(500)
	set @strRetCatName = (select strCategoryName from tblCategory where bintCategoryId = @CategoryId)
	
	if (len(isnull(@strRetCatName,'')) <= 0)
	begin
		return ''
	end
	
	if exists(select 1 from tblCategory where bintCategoryId = @CategoryId and ParentId <> 0 and ParentId <> @CategoryId)
	begin
	
		declare @ParCatId as int
		set @ParCatId = (select ParentId from tblCategory where bintCategoryId = @CategoryId)
		
		set @strRetCatName = [dbo].[GetCategoryHierarchyName](@ParCatId) + ' > ' + @strRetCatName
	end
 
  
	RETURN @strRetCatName

END

GO

