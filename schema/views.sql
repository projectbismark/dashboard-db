CREATE VIEW measurements as select *, or(param="ping",param="dns") from ping p, dnsqueries d where p.id = d.id;


