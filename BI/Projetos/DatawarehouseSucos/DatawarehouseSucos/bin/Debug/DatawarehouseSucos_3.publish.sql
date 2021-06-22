﻿/*
Deployment script for DW_SUCOS

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_SUCOS"
:setvar DefaultFilePrefix "DW_SUCOS"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key d9eb647f-327d-4f97-9f87-5dc1d702cbc3 is skipped, element [dbo].[Dim_Oragnizacional].[Id] (SqlSimpleColumn) will not be renamed to Cod_Filho';


GO
PRINT N'Creating [dbo].[Dim_Oragnizacional]...';


GO
CREATE TABLE [dbo].[Dim_Oragnizacional] (
    [Cod_Filho]  NVARCHAR (50)  NOT NULL,
    [Desc_Filho] NVARCHAR (200) NULL,
    [Cod_Pai]    NVARCHAR (50)  NULL,
    [Esquerda]   INT            NULL,
    [Direita]    INT            NULL,
    [Nivel]      INT            NULL,
    PRIMARY KEY CLUSTERED ([Cod_Filho] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Dim_Oragnizacional_Dim_Oragnizacional]...';


GO
ALTER TABLE [dbo].[Dim_Oragnizacional] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Oragnizacional_Dim_Oragnizacional] FOREIGN KEY ([Cod_Pai]) REFERENCES [dbo].[Dim_Oragnizacional] ([Cod_Filho]);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd9eb647f-327d-4f97-9f87-5dc1d702cbc3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d9eb647f-327d-4f97-9f87-5dc1d702cbc3')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Dim_Oragnizacional] WITH CHECK CHECK CONSTRAINT [FK_Dim_Oragnizacional_Dim_Oragnizacional];


GO
PRINT N'Update complete.';


GO