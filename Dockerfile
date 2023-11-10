FROM openjdk:11
EXPOSE 8089
COPY ./target/KaddemProject-1.0.jar /
ENTRYPOINT ["java","-jar","/KaddemProject-1.0.jar"]
