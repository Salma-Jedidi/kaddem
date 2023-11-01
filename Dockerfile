FROM openjdk:11
EXPOSE 8089

ENTRYPOINT ["java","-jar","/kaddemProject-1.0.jar"]
