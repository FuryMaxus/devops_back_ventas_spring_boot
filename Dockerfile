FROM maven:3.9-eclipse-temurin-17-alpine AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

RUN addgroup -S springgroup && adduser -S springuser -G springgroup

COPY --from=build /app/target/Springboot-API-REST-0.0.1-SNAPSHOT.jar app.jar

RUN chown springuser:springgroup app.jar

USER springuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]