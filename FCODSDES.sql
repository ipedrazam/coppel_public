create or replace function valida_fecha (in_ld_fecha_ini varchar2, in_ld_fecha_fin)
return number
is
ld_fecha_fin date;
ld_fecha_ini date;

begin

select TO_DATE(in_ld_fecha_ini,'RRRR/MM/DD HH24:MI:SS'), TO_DATE(in_ld_fecha_fin,'RRRR/MM/DD HH24:MI:SS') 
into ld_fecha_ini, ld_fecha_fin
from dual;

 IF ld_fecha_fin - ld_fecha_ini + 1 > 31 THEN
         wout_prc('El rango de fechas no puede ser mayor a un mes');
         retcode := 2;
         errbuf := 'ERROR 1';
         RETURN;
      END IF;

end;