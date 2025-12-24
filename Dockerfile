FROM eclipse-temurin:21-jre
WORKDIR /app

COPY target/config-service-1.0-SNAPSHOT.jar config-service-1.0-SNAPSHOT.jar

EXPOSE 8888
CMD ["java", "-jar", "config-service-1.0-SNAPSHOT.jar"]
