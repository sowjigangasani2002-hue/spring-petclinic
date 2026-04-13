FROM maven:3.9.12-eclipse-temurin-17-alpine AS build
ADD . /app
WORKDIR /app
RUN mvn package

FROM eclipse-temurin:25-noble
COPY --From=build /app/target/*.jar sowjanya.jar
EXPOSE 8080
CMD ["java", "-jar", "sowjanya.jar"]


