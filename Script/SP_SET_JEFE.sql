Create Procedure SP_SET_JEFE( @sjfe_Id int, @Nombre varchar(50),@Correo varchar(50),@json_semp_Id NVARCHAR(MAX))
as 
begin 
declare 
	@idNewAux int,
	@cantJefe int;

set @cantJefe = (SELECT COUNT(*)
	FROM OPENJSON(@json_semp_Id)
	  WITH (
		semp_Id INT 'strict $.semp_Id'
	  )); 

if(@sjfe_Id is null) 
	begin
		Insert into SPSG_Jefe(sjfe_Nombre, sjfe_Correo) values (@Nombre, @Correo)

		set @idNewAux = SCOPE_IDENTITY();

		if(@cantJefe> 0)
		begin 
			  insert into [dbo].[SPSG_Empleado_Jefe] ([emp_jf_semp_Id],[emp_jf_sjfe_Id])
			  (SELECT semp_Id, @idNewAux
				FROM OPENJSON(@json_semp_Id)
				WITH (
						semp_Id INT 'strict $.semp_Id'
				))
		end 
	end
else
	begin 
		update [dbo].[SPSG_Jefe]
		set [sjfe_Nombre] = @Nombre,
			[sjfe_Correo] = @Correo
		where [sjfe_Id] = @sjfe_Id

		delete from [SPSG_Empleado_Jefe]
					where [emp_jf_sjfe_Id] = @sjfe_Id

		if(@cantJefe> 0)
			begin 
					insert into [dbo].[SPSG_Empleado_Jefe] ([emp_jf_semp_Id],[emp_jf_sjfe_Id])
						(SELECT semp_Id, @sjfe_Id
							FROM OPENJSON(@json_semp_Id)
							WITH (
									semp_Id INT 'strict $.semp_Id'
							))
			end 
		end
	
select 1 as bit;
end 