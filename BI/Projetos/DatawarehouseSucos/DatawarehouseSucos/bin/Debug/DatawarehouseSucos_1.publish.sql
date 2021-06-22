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
PRINT N'Rename refactoring operation with key cc6541c6-94ca-41a5-8338-202cd3b26fc0 is skipped, element [dbo].[Dim_Cliente].[Id] (SqlSimpleColumn) will not be renamed to Cod_Cliente';


GO
PRINT N'Rename refactoring operation with key a8ed352c-9108-447f-aac7-3264b1ec0671 is skipped, element [dbo].[Dim_Cliente].[Cod_] (SqlSimpleColumn) will not be renamed to Cod_Cidade';


GO
PRINT N'Creating [dbo].[Dim_Cliente]...';


GO
CREATE TABLE [dbo].[Dim_Cliente] (
    [Cod_Cliente]   NVARCHAR (50)  NOT NULL,
    [Desc_cliente]  NVARCHAR (200) NULL,
    [Cod_Cidade]    NVARCHAR (50)  NULL,
    [Desc_Cidade]   NVARCHAR (200) NULL,
    [Cod_Estado]    NVARCHAR (50)  NULL,
    [Desc_Estado]   NVARCHAR (200) NULL,
    [Cod_Regiao]    NVARCHAR (50)  NULL,
    [Desc_Regiao]   NVARCHAR (200) NULL,
    [Cod_Segmento]  NVARCHAR (50)  NULL,
    [Desc_Segmento] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Cod_Cliente] ASC)
);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'cc6541c6-94ca-41a5-8338-202cd3b26fc0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('cc6541c6-94ca-41a5-8338-202cd3b26fc0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a8ed352c-9108-447f-aac7-3264b1ec0671')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a8ed352c-9108-447f-aac7-3264b1ec0671')

GO

GO
PRINT N'Update complete.';


GO
