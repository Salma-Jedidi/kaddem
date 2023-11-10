FROM openjdk:11
EXPOSE 8089

ENTRYPOINT ["java","-jar","/KaddemProject-1.0.jar"]
