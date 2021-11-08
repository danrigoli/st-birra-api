import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Meeting from 'App/Models/Meeting'
import MeetingValidator from 'App/Validators/MeetingValidator'
import { DateTime } from 'luxon'

export default class MeetingsController {
  public async index() {
    const meetings = await Meeting.query().preload('users')
    return meetings.map((meeting) => meeting.serialize())
  }

  public async store(ctx: HttpContextContract) {
    const payload = await ctx.request.validate(MeetingValidator)
    const meeting = await Meeting.create({ ...payload, admin_id: ctx.auth?.user?.id })
    return ctx.response.json(meeting)
  }

  public async update(ctx: HttpContextContract) {
    const payload = ctx.request.body()
    const meeting = await Meeting.findOrFail(ctx.params.id)
    meeting.date = payload.date ?? meeting.date
    meeting.title = payload.title ?? meeting.title
    meeting.description = payload.description ?? meeting.description
    meeting.place = payload.place ?? meeting.place
    await meeting.save()
    return ctx.response.json(meeting)
  }

  public async show(ctx: HttpContextContract) {
    const meeting = await Meeting.findOrFail(ctx.params.id)
    return ctx.response.json(meeting)
  }

  public async addToMeeting(ctx: HttpContextContract) {
    const user = ctx.auth.user
    const meeting = await Meeting.findOrFail(ctx.params.id)
    await meeting.related('users').attach([user.id])
    await meeting.load('users')
    return ctx.response.json(meeting)
  }

  public async removeFromMeeting(ctx: HttpContextContract) {
    const meeting = await Meeting.findOrFail(ctx.params.id)
    const user = ctx.auth.user
    await meeting.related('users').detach([user.id])
    await meeting.load('users')
    return ctx.response.json(meeting)
  }

  public async getUserMeetings({ auth, response }: HttpContextContract) {
    const user = auth.user
    const meetings = await Meeting.query()
      .where('date', '>', DateTime.local().toSQL())
      .whereHas('users', (builder) => {
        builder.where('users.id', user.id)
      })
    return response.json(meetings)
  }

  public async getAdminMeetings({ auth }: HttpContextContract) {
    const user = auth.user
    const meetings = await Meeting.query().where('admin_id', user.id).where('date', '>', DateTime.local().toSQL())
    return meetings.map((meeting) => meeting.serialize())
  }

  public async weekMeets({ auth }: HttpContextContract) {
    const user = auth.user
    const currentDate = DateTime.local()
    const endOfWeek = currentDate.endOf('week')
    const meetings = await Meeting.query()
      .whereBetween('date', [currentDate.toSQLDate(), endOfWeek.toSQLDate()])
      .whereDoesntHave('users', (builder) => {
        builder.where('users.id', user.id)
      })
      .preload('users')
    return meetings.map((meeting) => meeting.serialize())
  }

  public async allMeets({ auth }: HttpContextContract) {
    const user = auth.user
    const meetings = await Meeting.query()
      .whereDoesntHave('users', (builder) => {
        builder.where('users.id', user.id)
      })
      .where('date', '>', DateTime.local().toSQL())
      .preload('users')
    return meetings.map((meeting) => meeting.serialize())
  }

  public async destroy(ctx: HttpContextContract) {
    const meeting = await Meeting.findOrFail(ctx.params.id)
    await meeting.delete()
    return ctx.response.status(204).send('Meeting eliminada')
  }
}
