FROM ruby:2.3

RUN mkdir -p /opt/microservices
COPY . /opt/microservices/
EXPOSE 9080
WORKDIR /opt/microservices

CMD ruby app.rb 8080
