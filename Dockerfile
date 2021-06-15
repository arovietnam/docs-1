FROM sismics/ubuntu-jetty:9.4.12-2
MAINTAINER b.gamard@sismics.com

RUN apt-get update && apt-get -y -q install ffmpeg mediainfo tesseract-ocr tesseract-ocr-vie && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Remove the embedded javax.mail jar from Jetty
RUN rm -f /opt/jetty/lib/mail/javax.mail.glassfish-*.jar

ADD docs.xml /opt/jetty/webapps/docs.xml
ADD docs-web/target/docs-web-*.war /opt/jetty/webapps/docs.war

ENV JAVA_OPTIONS -Xmx2g
