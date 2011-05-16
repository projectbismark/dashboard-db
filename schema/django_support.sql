-- Need triggers for userdevice

-- To make generic trigges
-- TG_TABLE_NAME
-- TG_SCHEMA_NAME
-- TG_TRIGGER

drop trigger if exists gen_id_userdevices_insert on userdevices cascade;
drop trigger if exists gen_id_userdevices_update on userdevices cascade;

CREATE OR REPLACE function gen_id_userdevices_update() returns trigger as $gen_id_userdevices_update$
       BEGIN
       IF (new.userid != old.userid OR 
       	  new.deviceid != old.deviceid OR 
	  new.testseries != old.testseries)
	  THEN
	  new.id = sha1(new.userid || new.deviceid || new.testseries);
	  END IF;
       return NEW;
       END;
$gen_id_userdevices_update$
language plpgsql strict immutable;

CREATE OR REPLACE function gen_id_userdevices_insert() returns trigger as $gen_id_userdevices_update$
       BEGIN
	  new.id = sha1(new.userid || new.deviceid || new.testseries);
       return NEW;
       END;
$gen_id_userdevices_update$
language plpgsql strict immutable;

create trigger gen_id_userdevices_update before update on userdevices
	for each row execute procedure gen_id_userdevices_update();

create trigger gen_id_userdevice_insert before insert on userdevices
	for each row execute procedure gen_id_userdevices_insert();

CREATE OR REPLACE function gen_id_users_update() returns trigger as $gen_id_users_update$
       BEGIN
       IF (old.name IS NULL OR old.email IS NULL 
       	   OR new.name != old.name OR 
       	   new.email != old.email)
	  THEN
	  new.id = sha1(new.email || new.name);
	  END IF;
       return NEW;
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
	  RETURN NEW;
       END;
$gen_id_users_insert$
language plpgsql strict immutable;

drop trigger if exists gen_id_users_insert on users cascade;
drop trigger if exists gen_id_users_update on users cascade;

create trigger gen_id_users_insert before insert on users
	for each row execute procedure gen_id_users_insert();

create trigger gen_id_users_update before update on users
	for each row execute procedure gen_id_users_update();
