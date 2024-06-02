FROM openjdk:17-jdk-alpine

EXPOSE 5000

COPY ./target/java-rest-api-calculator.jar java-rest-api-calculator.jar

ENTRYPOINT ["java", "-jar", "java-rest-api-calculator.jar"]
