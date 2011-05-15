\i defaults.sql
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

CREATE OR REPLACE FUNCTION convert_to_integer(v_input text)
RETURNS INTEGER AS $$
DECLARE v_int_value INTEGER DEFAULT NULL;
BEGIN
    BEGIN
        v_int_value := v_input::INTEGER;
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'Invalid integer value: "%".  Returning NULL.', v_input;
        RETURN NULL;
    END;
RETURN v_int_value;
END;
$$ LANGUAGE plpgsql;

