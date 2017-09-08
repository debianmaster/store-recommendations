FROM ruby:2.4.1-alpine3.6

RUN mkdir -p /opt/microservices
COPY . /opt/microservices/
EXPOSE 8080
WORKDIR /opt/microservices

CMD ruby app.rb 8080
