FROM orienteer/orienteer:latest

RUN mkdir -p /tmp/src/
WORKDIR /tmp/src/
ADD . /tmp/src/
RUN mvn clean install

RUN mv target/creditcard.war /orienteer/
RUN cp orienteer.properties /orienteer/


WORKDIR /orienteer/
RUN rm -rf /tmp/src/
RUN ln -s -f creditcard.war active.war
