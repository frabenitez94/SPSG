CREATE PROCEDURE SP_DELETE_EMPLEADO
@semp_Id int

as 

begin 

delete from [SPSG_Empleado_Jefe]
	where [emp_jf_semp_Id] = @semp_Id


delete from [SPSG_Empleado]
	where [semp_Id] = @semp_Id


select 1 as bit;
end