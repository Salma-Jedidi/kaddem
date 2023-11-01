FROM openjdk:11
EXPOSE 8089
ADD Kaddem-Project-main/target/kaddemProject-1.0.jar kaddemProject-1.0.jar
ENTRYPOINT ["java","-jar","/kaddemProject-1.0.jar"]
