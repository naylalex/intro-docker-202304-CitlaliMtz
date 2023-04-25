FROM maven:latest  as builder
RUN apt-get update 
COPY . /words/
WORKDIR /words/
RUN mvn verify

FROM openjdk:8-jdk
COPY --from=builder /words/ ./
CMD ["java","-Xmx8m","-Xms8m","-jar","target/words.jar"]
