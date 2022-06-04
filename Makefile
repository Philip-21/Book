network :
     docker network create book-network


postgres : 
    docker run --name postgres14.3 --network book-network -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=philippians -d  postgres:14.3-alpine	


server :
      go run main.go 
