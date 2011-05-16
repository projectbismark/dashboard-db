-- Need triggers for userdevice

-- To make generic trigges
-- TG_TABLE_NAME
-- TG_SCHEMA_NAME
-- TG_TRIGGER

drop trigger if exists gen_id_userdevice_insert on users cascade;
drop trigger if exists gen_id_userdevice_update on users cascade;

CREATE OR REPLACE function gen_id_userdevice_update() returns trigger as $gen_id_userdevice_update$
       BEGIN
       IF (new.userid != old.userid OR 
       	  new.deviceid != old.deviceid OR 
	  new.testseries != old.testseries)
	  THEN
	  new.id = sha1(new.userid || new.deviceid || new.testseries));
	  END IF;
       return NULL;
       END;
$gen_id_userdevice_update$
language plpgsql strict immutable;

create trigger gen_id_userdevice_update before update on userdevice
	for each row execute procedure gen_id_userdevice_update();

create trigger gen_id_userdevice_insert before insert on userdevice
	for each row execute procedure gen_id_userdevice_insert();

-- CREATE OR REPLACE function gen_id_measurement() returns trigger as $gen_id_measurement$
--        BEGIN
--        IF (new.TG_TABLE_SCHEMA.TG_TABLE_NAME.deviceid !=
--        	   old.TG_TABLE_SCHEMA.TG_TABLE_NAME.deviceid OR 
--        	   new.TG_TABLE_SCHEMA.TG_TABLE_NAME.eventstamp !=
-- 	   old.TG_TABLE_SCHEMA.TG_TABLE_NAME.eventstamp OR 
-- 	   new.TG_TABLE_SCHEMA.TG_TABLE_NAME.dst !=
-- 	   old.TG_TABLE_SCHEMA.TG_TABLE_NAME.dst OR
-- 	   new.TG_TABLE_SCHEMA.TG_TABLE_NAME.src !=
-- 	   old.TG_TABLE_SCHEMA.TG_TABLE_NAME.src )
-- 	  THEN
-- 	  new.id = sha1(concat(
-- 	  new.TG_TABLE_SCHEMA.TG_TABLE_NAME.deviceid,
-- 	  new.TG_TABLE_SCHEMA.TG_TABLE_NAME.eventstamp,
-- 	  new.TG_TABLE_SCHEMA.TG_TABLE_NAME.dst,
-- 	  new.TG_TABLE_SCHEMA.TG_TABLE_NAME.src));
-- 	  END IF;
--        return NULL;
--        END;
-- $gen_id_measurement$
-- language plpgsql strict immutable;


CREATE OR REPLACE function gen_id_users_update() returns trigger as $gen_id_users_update$
       BEGIN
       IF (old.name IS NULL OR old.email IS NULL 
       	   OR new.name != old.name OR 
       	   new.email != old.email)
	  THEN
	  new.id = sha1(new.email || new.name);
	  END IF;
       return NULL;
       END;
$gen_id_users_update$
language plpgsql strict immutable;

-- fixme raise a sane error on email 
CREATE OR REPLACE function gen_id_users_insert() returns trigger as $gen_id_users_insert$
       BEGIN
       IF (NOT(new.name IS NULL OR new.email IS NULL))
	  THEN
	  new.id = sha1(new.email || new.name);
	  END IF;
	  RETURN NULL;
       END;
$gen_id_users_insert$
language plpgsql strict immutable;

drop trigger if exists gen_id_users_insert on users cascade;
drop trigger if exists gen_id_users_update on users cascade;

create trigger gen_id_users_insert before insert on users
	for each row execute procedure gen_id_users_insert();

create trigger gen_id_users_update before update on users
	for each row execute procedure gen_id_users_update();
