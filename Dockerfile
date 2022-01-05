FROM maven:3.8.4-jdk-8 as builder
RUN mkdir /app
WORKDIR /app
COPY . .
RUN mvn clean package
FROM tomcat
WORKDIR /usr/local/tomcat/webapps
COPY --from=builder app/target/*.war .
