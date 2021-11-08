# Birra API

El projecto utiliza <a href='https://adonisjs.com/'>AdonisJS</a> con MySQL 8.0.26.
Incluye Japa con NYC para el Testing y Coverage, y Swagger para la documentacion.

## Instalacion

Primero instalamos dependencias: `npm i`
Luego copiamos el .env.example: `cp .env.example .env`
Luego corremos las migraciones: `node ace migration:run`. Cabe aclarar que tenemos que tener un esquema llamado santander_adonis, o bien, cambiarlo en el .env
Ahora levantamos el servidor: `npm run dev` o `node ace serve --watch`
Si todo esta bien, deberias poder acceder a http://127.0.0.1:3333 sin problemas (a menos que tengas el puerto ocupado)

Si por alguna razon, no pudiste levantar las migraciones, hay un dump en la carpeta utils con lo justo y necesario.

## Testing
Si bien esta instalado, no cree ningun testing exceptuando el de ejemplo. 
Para poder correr el testing debe correr `npm run test` y `npm run coverage` para el coverage.

## Documentacion

Una vez que tengas el server levantado, podes acceder a http://localhost:3333/docs/index.html#/ y ver la documentacion de todos los endopoints de la API.

## Consideraciones
Para la Weather API elegi: https://rapidapi.com/community/api/open-weather-map, principalmente porque era la que menos ms tenia. Tuve un par de problemas, por ejemplo, no me dejaba mandarle una fecha para que revise el clima, sino que podia ver 16 dias en el futuro (y eso a veces ni me devolvia los dias). Entonces tome el clima actual de la localidad.
La Weather API aveces se bloquea, por lo que en utils guarde una response de la API y cargara por defecto si la Weather API no devuelve nada o devuelve error.
Con el tema de localizacion, queria usar la API de Google para que puedas escribir la direccion exacta pero por peleas con los de Google Cloud no tengo acceso a esas APIs por el momento. Entonces, agarre la API del gobierno para seleccionar la provincia y luego la localidad.

## Docker
La verdad es que queria implementar docker-compose pero por restricciones de tiempo no me fue posible, ya que en mi maquina no lo utilizo y hacer toda la instalacion iba a tardar demasiado en epocas de finales :(

## Dudas

Cualquier duda no tengo problema en responderlas :D.
