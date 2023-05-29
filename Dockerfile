FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package
RUN java -jar target/docker-message-server-1.0.0.jar
COPY target/docker-message-server-1.0.0.jar message-server-1.0.0.jar
ENTRYPOINT ["java","-jar","/message-server-1.0.0.jar"]
