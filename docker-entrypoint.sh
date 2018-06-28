#! /bin/sh

cd /leos/tools/user-repo
mvn spring-boot:run -Drun.profiles=h2 &

cd /leos/tools/cmis/chemistry-opencmis-server-inmemory
mvn jetty:run-war &

cd /leos/modules/web-os
mvn jetty:run-war 


