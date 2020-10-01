cd itinerary-service/
./mvnw clean install
cd ../
cd discovery-server/
./mvnw clean install
cd ../
cd city-service/
cd config && export $(cat config.env | xargs) && cd ../
./mvnw clean install
cd ../
cd gateway/
cd config && export $(cat config.env | xargs) && cd ../
./mvnw clean install
cd ../
