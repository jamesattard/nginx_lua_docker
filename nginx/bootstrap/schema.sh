#!/bin/bash

# Setup Schema
psql -U user1 -h db_master -d db1 -c "CREATE TABLE articles ( \
 id serial PRIMARY KEY, \
 title varchar(50) NOT NULL, \
 body varchar(32000) NOT NULL, \
 created_at timestamp DEFAULT current_timestamp);"
