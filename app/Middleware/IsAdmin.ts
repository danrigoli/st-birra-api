import { AuthenticationException } from '@adonisjs/auth/build/src/Exceptions/AuthenticationException'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class IsAdmin {
  public async handle({ auth }: HttpContextContract, next: () => Promise<void>) {
    if (!auth.user?.isAdmin()) {
      throw new AuthenticationException('Unauthorized access', 'E_UNAUTHORIZED_ACCESS')
    } else await next()
  }
}
