#Cách 1

#FROM openjdk:oraclelinux8
#WORKDIR /app
#COPY .mvn/ .mvn
#COPY mvnw pom.xml ./
#RUN ./mvnw dependency:go-offline
#COPY src ./src
#CMD ["./mvnw", "spring-boot:run"]


#Cách 2
# Sử dụng một hình ảnh cơ sở với Java
FROM openjdk:8-jre-alpine
# Tạo thư mục /app trong container và thiết lập nó làm thư mục làm việc
WORKDIR /app
# Sao chép các tệp JAR của ứng dụng và tệp cấu hình vào thư mục /app trong container
COPY target/springboot-docker.jar /app/springboot-docker.jar
COPY src/main/resources/application.properties /app/application.properties
# Cổng mà ứng dụng sẽ lắng nghe
EXPOSE 8080
# Lệnh để chạy ứng dụng Spring Boot
CMD ["java", "-jar", "springboot-docker.jar"]

##Cách 3
## Stage 1: Build the application
#FROM maven:3.5.2-slim AS builder
#WORKDIR /app
## Sao chép tệp POM và các nguồn của ứng dụng
#COPY pom.xml .
#COPY src/ src/
#RUN mvn clean install
#
## Stage 2: Create the final lightweight image
#FROM openjdk:8-jre-alpine
#WORKDIR /app
## Sao chép tệp JAR từ Stage 1
#COPY --from=builder /app/target/springboot-docker.jar app.jar
#EXPOSE 8080
#CMD ["java", "-jar", "app.jar"]
