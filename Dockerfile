FROM maven:3.9-eclipse-temurin-17 AS build
RUN /bin/sh
CMD ["ls", "-al"]
CMD ["pwd"]
