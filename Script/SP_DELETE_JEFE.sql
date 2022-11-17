ALTER PROCEDURE SP_DELETE_JEFE
@sjfe_Id int

as 

begin 

delete from [SPSG_Empleado_Jefe]
	where [emp_jf_sjfe_Id] = @sjfe_Id


delete from [SPSG_Jefe]
	where [sjfe_Id] = @sjfe_Id



select 1 as bit;
end