FROM eclipse-temurin:17-alpine
RUN cp -R /home/ubuntu/workspace/E-commerce-MS-CI/JtProject/target/JtSpringProject-0.0.1-SNAPSHOT.jar /apps/JtSpringProject-0.0.1-SNAPSHOT.jar
WORKDIR /apps
EXPOSE 8084
# CMD Executes when the container is started
CMD [ "java", "-jar", "JtSpringProject-0.0.1-SNAPSHOT.jar" ]
