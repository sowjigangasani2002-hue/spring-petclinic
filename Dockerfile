FROM maven:3.9.12-eclipse-temurin-17-alpine AS build

WORKDIR /app
COPY . /app
RUN mvn clean package

FROM eclipse-temurin:17-jdk

LABEL project="java"
LABEL author="devopsteam"

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]