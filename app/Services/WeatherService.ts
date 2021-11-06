import Env from '@ioc:Adonis/Core/Env'

export async function getWeather(city: string) {
  var axios = require('axios').default

  var options = {
    method: 'GET',
    url: 'https://' + Env.get('WEATHER_API') + '/weather',
    params: {
      q: city,
      units: 'imperial',
    },
    headers: {
      'x-rapidapi-host': Env.get('WEATHER_API'),
      'x-rapidapi-key': Env.get('WEATHER_API_KEY'),
    },
  }

  return (await axios.request(options)).data
}
