FROM maven:3.9.12-eclipse-teaurin-17-alpine AS build
ADO . /app
WORKDIR /appRUN mvn package

FROM eclipse-teaurin:17.0.18_8-jdk-noble AS Runtime
LABEL myproject=java
LABEL author-devopsteam
ARG username=spc
ENV JAVA_HOME=/usr/lib/jvm/
RUN useradd -m -d /usr/share/aws -s /bin/bash $(username)
USER $(username)
WORKDIR /usr/share/awsCOPY --from=build /app/target/*.jar sowjanya.jarEXPOSE 8080
CMD ["java", "-jar", "sowjanya.jar"]