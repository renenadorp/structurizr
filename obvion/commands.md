# Commands to startup
## Docker build
`
docker build -f Dockerfile.struct -t struct .
docker build -f Dockerfile.nginx -t nginx .
docker build -f Dockerfile.ping -t ping .
`
## Start Structurizr
>`
docker run -it --rm  -p 8080:8080 -v /Users/rnadorp/Documents/Internal/Structurizr/ra/:/usr/local/structurizr structurizr/lite
`

## Start Nginx
> `
docker run --name nginx   -d --rm  -p 8081:8081   -v  /Users/rnadorp/Documents/Internal/Structurizr/DnA/www/themes:/usr/share/nginx/html -d nginx
`

