FROM maven:3.9.12-eclipse-temurin-21 AS build
WORKDIR /workspace

COPY pom.xml pom.xml
COPY src src
RUN mvn -q -DskipTests package

FROM eclipse-temurin:21-jre
WORKDIR /app

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY --from=build /workspace/target/config-service-1.0-SNAPSHOT.jar config-service-1.0-SNAPSHOT.jar
EXPOSE 8888
CMD ["java", "-jar", "config-service-1.0-SNAPSHOT.jar"]
