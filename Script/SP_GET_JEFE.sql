
Alter Procedure SP_GET_JEFE
(	@Nombre varchar(50),
	@Correo varchar(50),
	@pagina int,
	@filas int)
as 
begin 

SET NOCOUNT ON;

	set @pagina = ISNULL(@pagina,1)
	set @filas = ISNULL(@filas,999999)

	IF @pagina is null or @pagina <= 0
	BEGIN
		SELECT @pagina = 1
	END;

	IF @filas is null or @filas < 1
	BEGIN
		select @filas = 1
	END;

select
	CAST(CEILING(CAST(COUNT(1) OVER() as float) / CAST(@filas as float)) as int)				AS 'CantRegistros',
	*,
	(select SPSG_Empleado.* 
		from [dbo].[SPSG_Empleado_Jefe] inner join [dbo].[SPSG_Empleado] on [emp_jf_semp_Id] = [semp_Id]
		where [emp_jf_sjfe_Id] = [sjfe_Id]
		FOR JSON AUTO) as jsonEmpleados
from [dbo].[SPSG_Jefe]

where [sjfe_Nombre] like '%' +  isnull(@Nombre,'') +'%' 
	  and 
	  [sjfe_Correo] like '%' +  isnull(@Correo,'') +'%' 

end
