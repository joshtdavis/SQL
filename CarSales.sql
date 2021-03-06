USE [AutoDealer]
GO
CREATE TABLE [dbo].[CarOwners](
	[OwnerID] [int] NOT NULL,
	[CarID] [char](15) NOT NULL,
 CONSTRAINT [PK_CarOwners] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC,
	[CarID] ASC
)
)
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
) 
GO
INSERT [dbo].[CarOwners] ([OwnerID], [CarID]) VALUES (1, N'OMM404YJA398O  ')
GO
INSERT [dbo].[CarOwners] ([OwnerID], [CarID]) VALUES (2, N'BPV148UZX168L  ')
GO
INSERT [dbo].[CarOwners] ([OwnerID], [CarID]) VALUES (4, N'NQS860XPP113B  ')
GO
INSERT [dbo].[CarOwners] ([OwnerID], [CarID]) VALUES (5, N'HOR025JJR892I  ')
GO
INSERT [dbo].[CarOwners] ([OwnerID], [CarID]) VALUES (7, N'HTZ660GGV525P  ')
GO
INSERT [dbo].[CarOwners] ([OwnerID], [CarID]) VALUES (9, N'GCQ939YHC883R  ')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (1, N'Ron', N'Naik')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (2, N'Sherry', N'Traylor')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (3, N'Matt', N'Crisp')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (4, N'Dana', N'Roman')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (5, N'Shannon', N'Schimelman')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (6, N'Pradeep', N'Boglovits')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (7, N'Derek', N'Curlis')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (8, N'Ana', N'Prager')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (9, N'Jeff', N'Allen')
GO
INSERT [dbo].[Customers] ([ID], [FirstName], [LastName]) VALUES (10, N'Melanie', N'Westrick')
GO
ALTER TABLE [dbo].[CarOwners]  WITH CHECK ADD  CONSTRAINT [FK_CarID] FOREIGN KEY([CarID])
REFERENCES [dbo].[RegisteredCars] ([VehicleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarOwners] CHECK CONSTRAINT [FK_CarID]
GO
ALTER TABLE [dbo].[CarOwners]  WITH CHECK ADD  CONSTRAINT [FK_OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Customers] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarOwners] CHECK CONSTRAINT [FK_OwnerID]
GO
