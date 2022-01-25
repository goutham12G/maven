

FROM  maven:amazoncorretto
WORKDIR /go/src/target/app
COPY . .
CMD ["app"]
