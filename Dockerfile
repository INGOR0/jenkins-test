FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY b2b-api-backend-0.3.0-SNAPSHOT.jar app.jar
EXPOSE 8100
ENTRYPOINT ["java", "-jar", "app.jar"]
