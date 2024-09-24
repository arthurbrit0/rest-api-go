FROM golang:1.23.1

COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# set working directory
WORKDIR /go/src/app

# Copy the source code
COPY . . 

#EXPOSE the port
EXPOSE 8000

# Build the Go app
RUN go build -o main cmd/main.go

# Run the executable
CMD ["/wait-for-it.sh", "go_db:5432", "--", "./main"]