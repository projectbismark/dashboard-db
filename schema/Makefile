DB:=$(USERNAME)

all: create

create:
	createdb $(DB)
	./setup.sh $(DB)

createall: clean create
	
tables:

indexes:

export:

import:

verify:

test:

clean:
	dropdb $(DB)

reallyclean: 
	dropdb $(DB)
	rm -f *.gsql */*.gsql */*/*.gsql
