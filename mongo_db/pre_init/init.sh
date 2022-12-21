#! /bin/bash

mongo < /docker-entrypoint-initdb.d/populate.json
# mongoimport --db {MONGO_INITDB_DATABASE} --collection platforms --type json --file /docker-entrypoint-initdb.d/populate.json --jsonArray
# CMD mongoimport --host ${MONGO_CONN_STR} --db {MONGO_INITDB_DATABASE} --collection platforms --type json --file /docker-entrypoint-initdb.d/populate.json