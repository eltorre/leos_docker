#! /bin/sh

cd /leos/modules/annotate/server
mvn spring-boot:run -Dspring.profiles.active=h2
