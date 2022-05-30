
#------BUILDING STAGE

#from specifies the base image  
FROM golang:1.18-alpine3.16
#declaring the current working directoryinside the image  WORKDIR /the/workdir/path 
WORKDIR /app
#Copy files from the root of the directory and all location into the docker container, 
#the second dot is where the files are being copied to(/app)
COPY . .   
#build the go app
RUN go build -o main main.go

#RUN STAGE 
EXPOSE 8080
CMD ["/app/main"]