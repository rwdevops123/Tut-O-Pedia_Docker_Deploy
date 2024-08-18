# SETUP

### SETUP DOCKER NETWORK

**RUN ./setup.sh**

This will create a network

- ``docker network create postgres_network`

### SETUP LIQUIBASE

> > copy/create db folder containing

- liquibase.properties
- local/db.changelog-master.xml (provisioning) and local/tutorials.csv (initialisation)
- local/changelog/##-db.changelog.sql (provisioning files)
  > > to project.

## RUN POSTGRES

`docker run -d \
-p 5432:5432 \
--name postgresdb \
-e POSTGRES_HOST_AUTH_METHOD=trust \
-e POSTGRES_DB=tutopedia_db \
-v $(pwd)/pgdata:/var/lib/postgresql/data \
--net postgres_network \
postgres`

## RUN LIQUIBASE

`docker run -d \
--name liquibase \
--net postgres_network \
-v ./db:/db \
liquibase update \
--defaults-file=/db/liquibase.properties`

### CHECK DATABASE in pgAdim

> > Register Server

> > - name: PostgreSQL Docker
> > - host: localhost
> > - port: 5432
> > - username: postgres
> > - password: password

Now check from table : **tutopedia_db**

It _should_ contain two tables:

- files
- tutorials (and data is loaded from tutorials.csv into table tutorials)

(together with their sequences)

## compose.yaml

The 2 services (postgreSQL and Liquibase) are combined in the compose.yaml file.

> > **STARTUP** : `docker compose -p tut_o_pedia up -d`

> > **TEARDOWN** : `docker compose down -v`

# BACKEND

# FRONTEND
