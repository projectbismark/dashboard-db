\i defaults.cfg

CREATE TABLE measurements_tmpl (
    deviceid deviceid_t,
    toolid integer,
    src inetn_t,
    dst inetn_t,
    eventstamp eventstamp_t,
    average float8,
    std float8,
    minimum float8,
    maximum float8,
    median float8,
    iqr float8,
    id id_t,
    unique(id),
    primary key (deviceid, eventstamp, dst, src) -- dst,src maybe not needed
);

-- ALTERTABLE COLUMN SET STORAGE external for the !@#!@ ids
-- FIXME, new is always new? do I need to grab the value of old?

CREATE OR REPLACE function gen_id_measurement_update() returns trigger as $gen_id_measurement_update$
       BEGIN
       IF (new.deviceid !=
       	   old.deviceid OR 
       	   new.eventstamp !=
	   old.eventstamp OR 
	   new.dst !=
	   old.dst OR
	   new.src !=
	   old.src )
	  THEN
	  new.id = sha1( new.deviceid || new.eventstamp || 
	  	   	 new.dst || new.src));
	  END IF;
       return NULL;
       END;
$gen_id_measurement_update$
language plpgsql strict immutable;


CREATE OR REPLACE function gen_id_measurement_insert() returns trigger as $gen_id_measurement_insert$
       BEGIN
	  THEN
	  new.id = sha1( new.deviceid || new.eventstamp || 
	  	   	 new.dst || new.src));
	  END IF;
       return NULL;
       END;
$gen_id_measurement_insert$
language plpgsql strict immutable;

create trigger gen_id_measurements_update before update on measurements_tmpl
	for each row execute procedure gen_id_measurement_update();

create trigger gen_id_measurements_insert before insert on measurements_tmpl
	for each row execute procedure gen_id_measurement_insert();
