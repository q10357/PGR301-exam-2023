FROM maven:3.6-jdk-17 as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package

FROM eclipse-temurin:17-jdk-jammy
COPY --from=builder /app/target/*.jar /app/application.jar
ENTRYPOINT ["java","-jar","/app/application.jar"]