# Create the base image for build
FROM openjdk:16-alpine3.13 as base
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY src ./src

# Create an image for running tests
FROM base as test
RUN ["./mvnw", "test"]

# Create an image to package the application
FROM base as build
RUN ./mvnw package

# Create the final (minimal) image for deployment
FROM openjdk:11-jre-slim
EXPOSE 8080
COPY --from=build /app/target/spring-petclinic-*.jar /spring-petclinic.jar
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-petclinic.jar"]
