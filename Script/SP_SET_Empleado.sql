ALTER Procedure SP_SET_EMPLEADO
	@semp_Id int, 
	@Nombre varchar(50),
	@Correo varchar(50), 
	@json_sjfe_Id NVARCHAR(MAX)
as 
begin 
declare 
	@idNewAux int,
	@cantJefe int;

	
--set @json_sjfe_Id  = N'[
--  {"sjfe_Id": 2},
--  {"sjfe_Id": 5}
--]';

set @cantJefe = (SELECT COUNT(*)
	FROM OPENJSON(@json_sjfe_Id)
	  WITH (
		sjfe_Id INT 'strict $.sjfe_Id'
	  )); 
  
if(@semp_Id is null) 
begin

		Insert into [dbo].[SPSG_Empleado]([semp_Nombre], [semp_Correo]) values (@Nombre, @Correo)

		set @idNewAux = SCOPE_IDENTITY();

		if(@cantJefe> 0)
		begin 
			  insert into [dbo].[SPSG_Empleado_Jefe] ([emp_jf_sjfe_Id],[emp_jf_semp_Id])
			  (SELECT sjfe_Id, @idNewAux
				FROM OPENJSON(@json_sjfe_Id)
				WITH (
						sjfe_Id INT 'strict $.sjfe_Id'
				))
		end 

end
else
begin 

		update [dbo].[SPSG_Empleado]
		set [semp_Nombre] = @Nombre,
			[semp_Correo] = @Correo
		where [semp_Id] = @semp_Id


	if(@cantJefe> 0)
		begin 

				delete from [SPSG_Empleado_Jefe]
				where [emp_jf_semp_Id] = @semp_Id


				insert into [dbo].[SPSG_Empleado_Jefe] ([emp_jf_sjfe_Id],[emp_jf_semp_Id])
					(SELECT sjfe_Id, @semp_Id
						FROM OPENJSON(@json_sjfe_Id)
						WITH (
								sjfe_Id INT 'strict $.sjfe_Id'
						))
		end 
end

select 1 as bit;
end 