# nginx_lua_docker

- [Introduction](#introduction)
  - [Tech](#tech)
- [Getting started](#getting-started)
  - [Installation](#installation)
  - [Quickstart](#quickstart)

# Introduction
This is an nginx-lua based simple application based on docker. There is an nginx with lua on the front end, and two postgresql databases setup as master-slave on the backend. This is a private build, not found in DockerHub and author assumes no responsibility. It was part of a technical interview that the author decided to spice it up a bit using Docker.

## Tech
I am using the following Docker containers:
- Official Centos image to build Nginx and compile Lua
- Sameersbn PostgreSQL image to build a master-slave postgresql cluster

# Getting started

## Installation

````bash
git clone https://github.com/jamesattard/nginx_lua_docker.git
```

## Quickstart

Start the containers using:
````bash
docker-compose up -d db_master
docker-compose up -d db_slave
docker-compose up -d app_lua
```

Send a POST request to the app server:
````bash
docker exec -it nginxlua_app_lua_1 curl -X POST http://localhost:8080/post?title=Article1\&body=body1
```

Get the last 100 messages from the database:
````bash
docker exec -it nginxlua_app_lua_1 curl http://localhost:8080/get
```
