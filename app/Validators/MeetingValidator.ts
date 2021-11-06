import { schema, rules } from '@ioc:Adonis/Core/Validator'
import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class RegisterValidator {
  constructor(protected ctx: HttpContextContract) {}

  public schema = schema.create({
    title: schema.string({ trim: true }, [rules.maxLength(255)]),
    description: schema.string({ trim: true }, [rules.maxLength(255)]),
    date: schema.date({ format: 'yyyy-MM-dd' }, [rules.required()]),
    place: schema.string({ trim: true }, [rules.maxLength(255)]),
  })

  public messages = {}
}
