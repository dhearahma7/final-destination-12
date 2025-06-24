FROM nginx:alpine
RUN apk add --no-cache git
WORKDIR /tmp
RUN git clone https://github.com/dhearahma7/final-destination-12.git
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
RUN cp -r /tmp/final-destination-12/webapp/* .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
