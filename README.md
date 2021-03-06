# Birra API

El projecto utiliza <a href='https://adonisjs.com/'>AdonisJS</a> (aunque es TS) con MySQL 8.0.26.
Incluye Japa con NYC para el Testing y Coverage, y Swagger para la documentacion.

## Instalacion

Primero instalamos dependencias: `npm i`
Luego copiamos el .env.example: `cp .env.example .env`
Luego corremos las migraciones: `node ace migration:run`. Cabe aclarar que tenemos que tener un esquema llamado santander_adonis, o bien, cambiarlo en el .env
Ahora levantamos el servidor: `npm run dev` o `node ace serve --watch`
Para hacer funcionar la Weather API, necesitan generar credenciales: https://rapidapi.com/community/api/open-weather-map/
Si es necesario puedo pasarles mis credenciales, pero creo que me quedan menos de 50 de las 500 request gratuitas...
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

## Datos a tener en cuenta
Las api_token son Opaque Access Token, lo que quiere decir que solo se pueden validar con nuestro servidor.
Aparecen errores de IDE en los Controllers cuando llamo a auth.user pero porque no toma en cuenta el uso del middleware 'auth', asi que desestimarlo.
Me hubiese encantado separar la logica de los Controllers a Repositories pero:
1. Tiempo
2. AdonisJS tiene un gran problema y es la dependency injection en los Controllers, no puedo encontrar una manera de hacerlos funcionar (todavia) y quedaba desprolijo hacer new MeetingsRepository.

## Docker
La verdad es que queria implementar docker-compose pero por restricciones de tiempo no me fue posible, ya que en mi maquina no lo utilizo y hacer toda la instalacion iba a tardar demasiado en epocas de finales :(

## Dudas

Cualquier duda no tengo problema en responderlas :D.
