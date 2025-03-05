FROM maven:3.9-eclipse-temurin-17 AS build
COPY . /ecommerce
WORKDIR /ecommerce
RUN mvn package


FROM eclipse-temurin:17-alpine
ARG USERNAME=ecomm
RUN adduser -D -h /apps -s /bin/sh ${USERNAME}
USER ${USERNAME}
COPY --from=build  --chown=${USERNAME}:${USERNAME}  /ecommerce/target/JtSpringProject-0.0.1-SNAPSHOT.jar /apps/JtSpringProject-0.0.1-SNAPSHOT.jar
WORKDIR /apps
EXPOSE 8084
# CMD Executes when the container is started
CMD [ "java", "-jar", "JtSpringProject-0.0.1-SNAPSHOT.jar" ]
