#FROM app:v1 as baseimage
#COPY . /project
#COPY --chown=baseimage /usr/lib/gradle-2.12 /project
#WORKDIR /project
#ENV GRADLE_HOME=usr/lib/gradle-2.12
#ENV PATH=$PATH:$GRADLE_HOME/bin
#RUN ["gradle","build"]
#CMD gradle build
##RUN gradle build
#CMD ls
#CMD pwd
#CMD cd build/classes/main \ && java basic
#
#FROM azul/zulu-openjdk:8 AS baseimage
#COPY . /project
#ENV APP_HOME = /project
#WORKDIR /project
#RUN  apt-get update \
#  && apt-get install -y wget \
#  && apt-get install unzip \
#  && rm -rf /var/lib/apt/lists/*
#RUN wget https://downloads.gradle.org/distributions/gradle-7.5-bin.zip \
#&& unzip "gradle-7.5-bin.zip" \
#&& rm "gradle-7.5-bin.zip"
#Env set up
#ENV GRADLE_HOME=/gradle-7.5
#ENV PATH=$PATH:$GRADLE_HOME/bin
#RUN gradle version
#CMD cd /project/build/classes/main \ && java basic

#FROM base:v2 as base
#COPY . /
#ENV APP_HOME = /project
#ONBUILD RUN cp  /gradle-7.5 /project
#WORKDIR /project
#ENV GRADLE_HOME=$APP_HOME/gradle-7.5
#ENV PATH=$PATH:$GRADLE_HOME/bin
#RUN gradle -version
#RUN gradle build

#
FROM base:v2 as base
VOLUME /tmp
COPY . /
#WORKDIR /project
#ENV APP_HOME = /project
#ENV GRADLE_HOME=$APP_HOME/gradle-7.5
#ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle build
ADD /build/libs/spring_app-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT java -jar app.jar