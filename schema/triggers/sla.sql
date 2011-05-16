\i defaults.cfg

CREATE OR REPLACE function gen_id_sla_update() returns trigger as $gen_id_sla_update$
       BEGIN
       IF (new.isp !=
       	   old.isp OR 
       	   new.sla !=
	   old.sla)
	  THEN
	  new.id = sha1( new.isp || new.sla );
	  END IF;
       return NEW;
       END;
$gen_id_sla_update$
language plpgsql strict immutable;


CREATE OR REPLACE function gen_id_sla_insert() returns trigger as $gen_id_sla_insert$
       BEGIN
	  new.id = sha1( new.isp || new.sla );
       return NEW;
       END;
$gen_id_sla_insert$
language plpgsql strict immutable;

create trigger gen_id_sla_update before update on sla
	for each row execute procedure gen_id_sla_update();

create trigger gen_id_sla_insert before insert on sla
	for each row execute procedure gen_id_sla_insert();
