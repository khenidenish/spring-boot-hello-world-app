FROM openjdk:11-jdk-slim

WORKDIR /app

COPY pom.xml .

RUN apt-get update && apt-get install -y maven

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean install

COPY target/my-app-0.0.1-SNAPSHOT.jar /app/my-app.jar
CMD java -jar my-app.jar
