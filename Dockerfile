FROM nginx
ADD www /www
RUN rm /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/
