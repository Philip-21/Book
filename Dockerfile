
#multistaging docker file to reduce the size of docker image 


#------BUILDING STAGE
#from specifies the base image for build stage  
FROM golang:1.18-alpine3.16 AS builder
#declaring the current working directoryinside the image  WORKDIR /the/workdir/path 
WORKDIR /app
#Copy files from the root of the directory and all location into the docker container, 
#the second dot is where the files are being copied to(/app)
COPY . .   
#build the go app
RUN go build -o  main.go

#--------------RUN STAGE 
#specifies base image for the run stage(using alpine to make the image small and compatible)
FROM alpine:3.16
WORKDIR /app
#copying file from the builder stage, the files are copied to /app 
COPY --from=builder /app/main.go .



EXPOSE 8080
CMD ["/app/main.go"]