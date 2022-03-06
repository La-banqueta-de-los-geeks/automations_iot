cd enviroments/
cp .dummy.postgresql .env.postgresql 
cp .dummy.iot_administration .env.iot_administration
cd ..
cd iot_administration
git checkout main
cd ..
cd iot_frontend
git checkout main
docker-compose build
docker-compose up -d
docker-compose  exec iot_administration bundle
docker-compose  exec iot_administration rails  db:create db:schema:load
