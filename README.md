# Automation IOT
## Antes de empezar
Requerimos tener en nuestro enviroment instalado lo siguiente
* Docker
* Docker compose
## Clonar repositorio
El proyecto se compone de dos repositorios, el repositorio principal donde tenemos nuestro archivo docker compose y configuramos nuestras variables de ambiernte.

`git clone  --recurse-submodules  https://github.com/La-banqueta-de-los-geeks/automations_iot automations`

## Iniciando el setup
Copiar nuestros archivos de la carpeta enviroments removiendo la palabra example y escribiendo el valor de nuestras credenciales o dejar las credenciales de ejemplo.
``` bash
  cd enviroments/
  # Si vas a escribir tu configuracion realiza estos pasos
  cp .example.postgresql .env.postgresql 
  cp .example.iot_administration .env.iot_administration
  # Si no sabes que estas haciendo y/o solo deseas ejecutar el proyecto realiza estos pasos
  cp .dummy.postgresql .env.postgresql 
  cp .dummy.iot_administration .env.iot_administration
```
Creamos nuestra imagen del proyecto automations iot administration
```
  docker-compose build
```
Iniciamos nuestros servicios
```
  docker-compose up -d
```
Creamos la base de datos del proyecto
```
  docker-compose  exec iot_administration rails db:create
```
Ejecutamos las migraciones del proyecto
```
  docker-compose exec iot_administration rails db:migrate
```
## Services
* Iot administration
  * Nombre del servicio: iot_administration
  * Port: 4000
  * Dependencias: iot_db_automation
* Postgres
  * Nombre del servicio: iot_db_automation
  * Image: postgres 13.2 
  * Port: 5430
* Redis
  * Nombre del servicio: iot_db_automation
  * Image: redis alpine
  * Port: 6378
* Iot sidekiq administration
  * Nombre del servicio: iot_sidekiq_administration
  * Image: iot_administration latest
* Iot sidekiq mailers
  * Nombre del servicio: iot_sidekiq_mailers
  * Image: iot_administration latest
  * Port: 25
* Maildev:
  * Image: djfarrelly/maildev
  * Port: 80