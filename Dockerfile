# syntax=docker/dockerfile:1.7-labs
FROM maven:3.9-amazoncorretto-21-debian as build

WORKDIR /app/

COPY pom.xml .

RUN mvn -B -q \
        -Dmaven.wagon.httpconnectionManager.ttlSeconds=25 \
        -Dmaven.wagon.http.retryHandler.count=3 \
        -Daether.connector.http.connectionMaxTtl=25 \
        org.apache.maven.plugins:maven-dependency-plugin:3.6.0:go-offline

RUN mvn -B -q \
        -Dmaven.wagon.httpconnectionManager.ttlSeconds=25 \
        -Dmaven.wagon.http.retryHandler.count=3 \
        -Daether.connector.http.connectionMaxTtl=25 \
        verify --fail-never

COPY . .

RUN mvn -B -o \
        -Dmaven.test.skip=true \
        package

FROM tomcat:11.0.0-jre21 as run

EXPOSE 8080

#COPY --from=build /app/web/target/thepusher-*/WEB-INF/classes/hibernate.cfg.xml /srv/thepusher/conf/
#COPY --from=build /app/web/target/thepusher-*/WEB-INF/classes/application.properties /srv/thepusher/conf/

COPY --from=build /app/target/app-for-compose-watch-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
