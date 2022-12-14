Alter	 Procedure SP_GET_EMPLEADO
(	
	@Nombre varchar(50),
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
	(select SPSG_Jefe.* 
		from [dbo].[SPSG_Empleado_Jefe] inner join [dbo].[SPSG_Jefe] on [emp_jf_sjfe_Id] = [sjfe_Id]
		where [emp_jf_semp_Id] = [semp_Id] 
		FOR JSON AUTO) as jsonJefes
from [dbo].[SPSG_Empleado]

where [semp_Nombre] like '%' +  isnull(@Nombre,'') +'%' 
	  and 
	  [semp_Correo] like '%' +  isnull(@Correo,'') +'%' 
ORDER BY semp_Id DESC
				OFFSET (@pagina - 1) * @filas ROWS
								FETCH NEXT @filas ROWS only;

end


