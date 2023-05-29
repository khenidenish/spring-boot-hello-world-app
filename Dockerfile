FROM openjdk:11-jdk-slim

WORKDIR /app

COPY pom.xml .

RUN apt-get update && apt-get install -y maven

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean install

CMD java -jar target/my-app-0.0.1-SNAPSHOT.jar
