FROM ubuntu:14.04
MAINTAINER Ben Axnick <ben@axnick.com.au>
RUN apt-get update
RUN apt-get install -y nginx
ADD www /www
EXPOSE 8080
CMD [ "nginx", "-c", "/www/nginx.conf" ]
