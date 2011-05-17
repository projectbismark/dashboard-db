\i defaults.cfg

CREATE OR REPLACE function gen_id_django_bs_update() returns trigger as $gen_id_django_bs_update$
       BEGIN
       IF (new.id != old.id OR 
       	   new.hop != old.hop OR
	  THEN
 	  new.django_bs = sha1( new.id || new.hop );
	  END IF;
       return NEW;
       END;
$gen_id_django_bs_update$
language plpgsql strict immutable;


CREATE OR REPLACE function gen_id_django_bs_insert() returns trigger as $gen_id_django_bs_insert$
       BEGIN
 	  new.django_bs = sha1( new.id || new.hop );
       return NEW;
       END;
$gen_id_django_bs_insert$
language plpgsql strict immutable;

create trigger gen_id_django_bs_update before update on traceroute_hops
	for each row execute procedure gen_id_django_bs_update();

create trigger gen_id_django_bs_insert before insert on traceroute_hops
	for each row execute procedure gen_id_django_bs_insert();
