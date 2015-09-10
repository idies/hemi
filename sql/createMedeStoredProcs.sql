/****** Object:  StoredProcedure [dbo].[spInsertDataset]    Script Date: 9/10/2015 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spInsertDataset] (
	@taskID int,
	@name varchar(100),
	@description varchar(1000),
	@slastUpdate varchar(30),
	@size varchar(50),
	@fileFormat varchar(100),
	@fileType varchar(100),
	@relatedData varchar(1000),
	@contactName varchar(100),
	@contactEmail varchar(100)
	)
	as

	begin

	declare @maxid int;
	declare @sql nvarchar(max);
	declare @params nvarchar(max);
	declare @lastUpdate date

	select @lastUpdate = cast(@slastupdate as date)


	

	select @maxid=max(datasetID) from dataset;

	set @sql = 'if not exists (select name from dataset where name=@name) 
		insert dataset(DatasetID, TaskID,  Name, Description, LastUpdate, Size, fileFormat, FileType, relatedData, ContactName, ContactEmail) 
		select @maxid+1, @taskID, @name, 
		@description, @lastUpdate, @size, @fileFormat, @fileType, @relatedData, @ContactName, @contactEmail;'
	set @params = 	'
	@maxID int,
	@taskID int,
	@name varchar(100),
	@description varchar(1000),
	@lastUpdate date,
	@size varchar(50),
	@fileFormat varchar(100),
	@fileType varchar(100),
	@relatedData varchar(1000),
	@contactName varchar(100),
	@contactEmail varchar(100)
	';
	
	execute sp_executesql @sql, @params, @maxID, @taskID, @name, @description, @lastUpdate, @size, @fileFormat, @fileType, @relatedData, @contactName, @contactEmail;

END

/*
exec spInsertDataset 1,'suetest09', 'test desc', '2014-02-01', '500GB', '.png', 'image', 'some related data', 'sue musicface', 'swerner@jhu.edu'

select cast ('2014-03-02' as date)
*/