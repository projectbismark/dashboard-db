CREATE OR REPLACE FUNCTION sha1(bytea) returns text AS $$
       SELECT encode(digest($1, 'sha1'), 'hex')
$$ LANGUAGE SQL STRICT IMMUTABLE;

create or replace function convert2inet(int) returns inet as $$
 declare oct1 int;
   oct2 int;
   oct3 int;
   oct4 int;
 begin
   oct1 := ((($1 >> 24) % 256) + 256) % 256;
   oct2 := ((($1 >> 16) % 256) + 256) % 256;
   oct3 := ((($1 >>  8) % 256) + 256) % 256;
   oct4 := ((($1      ) % 256) + 256) % 256;
   return oct1 || '.' || oct2 || '.' || oct3 || '.' || oct4;
 end$$ language plpgsql strict immutable;

