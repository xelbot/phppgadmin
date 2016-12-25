# phppgadmin

Build of phpPgAdmin with Docker

### Docker Pull Command

    $ docker pull xelbot/phppgadmin

### Postgres environment variables

Postgres will make of the following environment variables.

    POSTGRES_HOST=localhost
    POSTGRES_PORT=5432
    POSTGRES_DEFAULTDB=defaultdb

### Start the container

The container has all pre requisites set up to run phpPgAdmin. Specify all needed environment variables.

    $ sudo docker run -i -d -p 8080:80 -e POSTGRES_HOST=localhost -e POSTGRES_DEFAULTDB=dbname xelbot/phppgadmin

Trying the browser on URL http://localhost:8080
