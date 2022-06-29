create or replace trigger tr_control_empleados
before insert or update or delete
on empleados
for each row
  begin
   if(:new.sueldo>5000)then
    raise_application_error(-20000, 'SUELDO NO PUEDE SUPERAR LOS $5000.00');
   end if;
     insert into control values(user, sysdate, 'INSERCION');
   if(:old.seccion='Gerencia')then
    raise_application_error(-20000, 'NO SE PUEDE ELIMINAR PUESTO DE GERENCIA');
   end if;
    insert into control values(user, sysdate, 'BORRADO');
   if updating('documento')then
    raise_application_error(-20000,'NO SE PUEDE ACTUALIZAR NUMERO DE DOCUMENTOS');
   end if;
end tr_control_empleados;


insert into empleados values('67867833','Lesseur','Moni','Calle2 No. 8','Info',9000);

delete from empleados where seccion = 'Gerencia';

update empleados set documento = '11111111'
where documento = '22222222';