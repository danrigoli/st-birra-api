import Hash from '@ioc:Adonis/Core/Hash'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'
import LoginValidator from 'App/Validators/LoginValidator'
import RegisterValidator from 'App/Validators/RegisterValidator'

export default class AuthController {
  public async login({ auth, request, response }: HttpContextContract) {
    const payload = await request.validate(LoginValidator)

    const user = await User.findByOrFail('email', payload.email)

    if (!(await Hash.verify(user.password, payload.password))) {
      return response.badRequest('Invalid credentials')
    }
    return {
      user: user.serialize(),
      token: (await auth.use('api').attempt(user.email, payload.password)).toJSON(),
    }
  }

  public async register({ auth, request }) {
    const payload = await request.validate(RegisterValidator)
    const user = await User.create(payload)
    return { user: user.serialize(), token: (await auth.use('api').generate(user)).toJSON() }
  }

  public async logout({ auth, response }: HttpContextContract) {
    await auth.logout()
    return response.send(200)
  }

  public async check({ auth }: HttpContextContract) {
    return await auth.check()
  }
}
