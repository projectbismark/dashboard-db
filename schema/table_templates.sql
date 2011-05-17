\i defaults.cfg

-- deviceidref references userdevices(deviceid), but not unique across series

CREATE TABLE measurements_tmpl (
    deviceid deviceidref_t NOT NULL, 
    srcip inetn_t,
    dstip inetn_t,
    eventstamp eventstamp_t,
    average float8,
    std float8,
    minimum float8,
    maximum float8,
    median float8,
    iqr float8,
    exitstatus integer default -1,
    id id_t,
    toolid toolidref_t references tools(id),
    unique(id),
    primary key (deviceid, eventstamp, dst, src) -- dst,src maybe not needed
);

-- it's my hope that this attribute migrates to copies, but have to check

alter TABLE measurements_tmpl ALTER COLUMN toolid set storage EXTERNAL;
alter TABLE measurements_tmpl ALTER COLUMN id set storage EXTERNAL;

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
	  new.id = sha1( (new.deviceid) || 
			 to_char(new.eventstamp,'JHH24MISSUS') || 
	  	   	 host(new.dst) || 
			 host(new.src) ));
	  END IF;
       return NEW;
       END;
$gen_id_measurement_update$
language plpgsql strict immutable;

CREATE OR REPLACE function gen_id_measurement_insert() returns trigger as $gen_id_measurement_insert$
       BEGIN
	  new.id = sha1( new.deviceid || 
			 to_char(new.eventstamp,'JHH24MISSUS') || 
	  	   	 host(new.dst) || 
			 host(new.src)));
       return NEW;
       END;
$gen_id_measurement_insert$
language plpgsql strict immutable;

create trigger gen_id_measurements_update before update on measurements_tmpl
	for each row execute procedure gen_id_measurement_update();

create trigger gen_id_measurements_insert before insert on measurements_tmpl
	for each row execute procedure gen_id_measurement_insert();
