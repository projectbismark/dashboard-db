-- Need triggers for userdevice

CREATE OR REPLACE function gen_id_userdevice () returns trigger as $gen_id_userdevice$
       BEGIN
       IF new.userid != old.userid OR 
       	  new.deviceid != old.deviceid OR 
	  new.testseries != old.testseries
	  THEN
	  new.id = sha1(concat(userid,deviceid,testseries));
	  END IF
       return NULL;
       END;
$gen_id_userdevice$
language plpgsql strict immutable;

create trigger gen_id_userdevice before insert or update on userdevice
	for each row execute procedure gen_id_userdevice;

