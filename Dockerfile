FROM maven:3.9.12-eclipse-temurin-21 AS build
WORKDIR /workspace

COPY pom.xml pom.xml
COPY src src
RUN --mount=type=cache,target=/root/.m2 mvn -q -DskipTests -T 1C package

FROM eclipse-temurin:21-jre
WORKDIR /app

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY --from=build /workspace/target/config-service-1.0-SNAPSHOT.jar config-service-1.0-SNAPSHOT.jar
EXPOSE 8888
CMD ["java", "-jar", "config-service-1.0-SNAPSHOT.jar"]
