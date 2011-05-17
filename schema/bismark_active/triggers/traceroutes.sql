\i defaults.cfg

CREATE OR REPLACE function gen_id_traceroutes_update() returns trigger as $gen_id_traceroutes_update$
       BEGIN
       IF (new.deviceid != old.deviceid OR 
       	   new.srcip !=	old.srcip OR
       	   new.dstip !=	old.dstip OR
	   new.eventstamp != old.eventstamp)
	  THEN
 	  new.id = sha1( 
		new.deviceid || 
		host(new.srcip) || 
		host(new.dstip) || 
		to_char(new.eventstamp,'JHH24MISSUS'));
	  END IF;
       return NEW;
       END;
$gen_id_traceroutes_update$
language plpgsql strict immutable;


CREATE OR REPLACE function gen_id_traceroutes_insert() returns trigger as $gen_id_traceroutes_insert$
       BEGIN
 	  new.id = sha1( 
		new.deviceid || 
		host(new.srcip) || 
		host(new.dstip) || 
		to_char(new.eventstamp,'JHH24MISSUS'));
       return NEW;
       END;
$gen_id_traceroutes_insert$
language plpgsql strict immutable;

create trigger gen_id_traceroutes_update before update on traceroutes
	for each row execute procedure gen_id_traceroutes_update();

create trigger gen_id_traceroutes_insert before insert on traceroutes
	for each row execute procedure gen_id_traceroutes_insert();
