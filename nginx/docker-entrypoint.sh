#!/bin/bash
# Author: James Attard [info@jamesattard.com]


# Start nginx server
echo Starting Nginx...
/usr/local/openresty/nginx/sbin/nginx
echo Nginx started...

# Bootstrap
echo Running bootstrapping scripts...
pushd /tmp/bootstrap
list=`ls *.sh`
for script in $list
 do
  echo Running $script ...
  ./$script
 done
echo Bootstrapping complete...

# Spit logging
tail -f /usr/local/openresty/nginx/logs/access.log -f /usr/local/openresty/nginx/logs/error.log
