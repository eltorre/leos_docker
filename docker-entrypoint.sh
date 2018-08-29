#! /bin/sh

cd /leos/tools/user-repo
mvn spring-boot:run -Drun.profiles=h2 &

sleep 10

cd /leos/tools/cmis/chemistry-opencmis-server-inmemory
mvn jetty:run-war &

sleep 10

cd /leos/modules/annotate/server
mvn spring-boot:run -Dspring.profiles.active=h2 &

sleep 10

cd /leos/modules/web
mvn jetty:run-war 


