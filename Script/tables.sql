CREATE TABLE [dbo].[SPSG_Jefe](
	[sjfe_Id] [int] IDENTITY(1,1) NOT NULL,
	[sjfe_Nombre] [varchar](50) NOT NULL,
	[sjfe_Correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SPSG_Jefe] PRIMARY KEY CLUSTERED 
(
	[sjfe_Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SPSG_Empleado](
	[semp_Id] [int] IDENTITY(1,1) NOT NULL,
	[semp_Nombre] [varchar](50) NOT NULL,
	[semp_Correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SPSG_Empleado] PRIMARY KEY CLUSTERED 
(
	[semp_Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[SPSG_Empleado_Jefe](
	[emp_jf_Id] [int] IDENTITY(1,1) NOT NULL,
	[emp_jf_sjfe_Id] [int] NOT NULL,
	[emp_jf_semp_Id] [int] NOT NULL,
 CONSTRAINT [PK_SPSG_Empleado_Jefe] PRIMARY KEY CLUSTERED 
(
	[emp_jf_Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[SPSG_Empleado_Jefe]  WITH CHECK ADD  CONSTRAINT [FK_SPSG_Empleado_Jefe_SPSG_Jefe] FOREIGN KEY([emp_jf_sjfe_Id])
REFERENCES [dbo].[SPSG_Jefe] ([sjfe_Id])
GO

ALTER TABLE [dbo].[SPSG_Empleado_Jefe]  WITH CHECK ADD  CONSTRAINT [FK_SPSG_Empleado_Jefe_SPSG_Empleado] FOREIGN KEY([emp_jf_semp_Id])
REFERENCES [dbo].[SPSG_Empleado] ([semp_Id])
GO