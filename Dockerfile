#getting base image debian
FROM debian
COPY 7361LGV_lab1.sh
RUN apt-get update
RUN apt-get install vim
