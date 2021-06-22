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
PRINT N'Rename refactoring operation with key 256764c0-c10a-4cf4-b58c-6c9a6dd75989 is skipped, element [dbo].[Dim_Categoria].[Id] (SqlSimpleColumn) will not be renamed to Cod_Categoria';


GO
PRINT N'Rename refactoring operation with key 6926c729-01ba-466e-8517-487c71964ab1 is skipped, element [dbo].[Dim_Marca].[Id] (SqlSimpleColumn) will not be renamed to Cod_Marca';


GO
PRINT N'Rename refactoring operation with key 50a9b9df-4f28-4b8a-a846-70be42a2bd6b is skipped, element [dbo].[Dim_Produto].[Id] (SqlSimpleColumn) will not be renamed to Cod_Produto';


GO
PRINT N'Creating [dbo].[Dim_Categoria]...';


GO
CREATE TABLE [dbo].[Dim_Categoria] (
    [Cod_Categoria]  NVARCHAR (50)  NOT NULL,
    [Desc_Categoria] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Cod_Categoria] ASC)
);


GO
PRINT N'Creating [dbo].[Dim_Marca]...';


GO
CREATE TABLE [dbo].[Dim_Marca] (
    [Cod_Marca]     NVARCHAR (50)  NOT NULL,
    [Desc_Marca]    NVARCHAR (200) NULL,
    [Cod_Categoria] NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Cod_Marca] ASC)
);


GO
PRINT N'Creating [dbo].[Dim_Produto]...';


GO
CREATE TABLE [dbo].[Dim_Produto] (
    [Cod_Produto]  NVARCHAR (50)  NOT NULL,
    [Desc_Produto] NVARCHAR (200) NULL,
    [Atr_Tamanho]  NVARCHAR (200) NULL,
    [Atr_Sabor]    NVARCHAR (200) NULL,
    [Cod_Marca]    NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Cod_Produto] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Dim_Marca_Dim_Categoria]...';


GO
ALTER TABLE [dbo].[Dim_Marca] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Marca_Dim_Categoria] FOREIGN KEY ([Cod_Categoria]) REFERENCES [dbo].[Dim_Categoria] ([Cod_Categoria]);


GO
PRINT N'Creating [dbo].[FK_Dim_Produto_Dim_Marca]...';


GO
ALTER TABLE [dbo].[Dim_Produto] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Produto_Dim_Marca] FOREIGN KEY ([Cod_Marca]) REFERENCES [dbo].[Dim_Marca] ([Cod_Marca]);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '256764c0-c10a-4cf4-b58c-6c9a6dd75989')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('256764c0-c10a-4cf4-b58c-6c9a6dd75989')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6926c729-01ba-466e-8517-487c71964ab1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6926c729-01ba-466e-8517-487c71964ab1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '50a9b9df-4f28-4b8a-a846-70be42a2bd6b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('50a9b9df-4f28-4b8a-a846-70be42a2bd6b')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Dim_Marca] WITH CHECK CHECK CONSTRAINT [FK_Dim_Marca_Dim_Categoria];

ALTER TABLE [dbo].[Dim_Produto] WITH CHECK CHECK CONSTRAINT [FK_Dim_Produto_Dim_Marca];


GO
PRINT N'Update complete.';


GO