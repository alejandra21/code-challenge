# CODING CHALLENGE

This repository contains the instructions for the solution to the problem presented [here]()

* The solution of this challenge was made with the help of Spring Boot, Spring Cloud, PostgreSQL and Docker
* The instructions below are for Debian based systems, in particular Ubuntu.

## Solution approach

In this problem, the shortest paths had to be found, by time or by steps to the rest of the cities that were in DB. The requirements requested that at least two microservices had to be implemented: 
 * A microservice to get and return the information about the cities stored in DB
 * A microservice to get cities' data and processes them to find the shortest paths. 
  
I implemented four microservices to solve the problem:

* A microservice that connects to the database and returns the cities' information
* A microservice that invokes the first one and finds the shortest paths
* A Eureka server that takes care of: “Eureka Server is an application that holds the information about all client-service applications. Every Micro service will register into the Eureka server and Eureka server knows all the client applications running on each port and IP address ”
* A gateway. It also has security settings to prevent users from accessing the rest of the services without prior identification.

Below is a picture of the services and its connections.

![alt text][logo]

[logo]: https://github.com/alejandra21/code-challenge/blob/main/doc/image.png

My idea is that the gateway is the only microservice that is exposed to users and that the rest are hidden in an internal network.

In theory, in order to access the service we are interested in (the itinerary service), we should authenticate using the gateway microservice, obtain the response JWT, and use it as a Barer token in the rest of the calls from the gateway endpoints server.

The only microservice that has security through JWT is the gateway, since the rest cannot be used by common users

## Repositories of the microservices included in the solution

As mentioned above, the solution is based on the use of four microservices whose repositories are found below

* [Eureka server](https://github.com/alejandra21/discovery-server): Netflix Eureka server
* [City server](https://github.com/alejandra21/city-service): Microservice in charge of providing information about cities and their connections
* [Itinerary server](https://github.com/alejandra21/itinerary-service): Microservice in charge of providing information on the itinerary by hour, or by connections of a specific city
* [Gateway](https://github.com/alejandra21/gateway): Service that works as a gateway

## Dependencies
* To run the entire project with the help of the scripts that this repository has, it is necessary to have installed [Docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/)

## Instructions to run the whole project

Here are the instructions to run the project using the scripts in this repository:

1. Clone **this** repository **first**, in your PC (git clone )
2. Execute the following command: 
```
cd code-challenge/
```
3. Clone in **code-challenge** directory, all of the repositories explained previously:
    * [Eureka server](https://github.com/alejandra21/discovery-server)
    * [City server](https://github.com/alejandra21/city-service)
    * [Itinerary server](https://github.com/alejandra21/itinerary-service)
    * [Gateway](https://github.com/alejandra21/gateway)
4. When You have all the repositories in the directory, You could execute the following command to build all of the microservices:
```
./build-microservices.sh
```
5. When *build-microservices* script finishes, You could execute the following command to run the project in Docker
```
./docker-up.sh
```
6. When all the services are active, you will be able to access their apis
    * Eureka server has a user interface where you can see all the connected microservices in `http://<ip_eureka_server>:8761/`
    * City server has its API documentation in `http://<ip_city_server>:8090/swagger-ui.html`
    * Itinerary server has its API documentation in `http://<ip_itinerary>:8080/swagger-ui.html`
    * Gateway server has its API documentacion in `http://<ip_gateway>:8081/swagger-ui.html`

