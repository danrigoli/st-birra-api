import { DateTime } from 'luxon'
import {
  afterFetch,
  afterFind,
  BaseModel,
  column,
  computed,
  ManyToMany,
  manyToMany,
} from '@ioc:Adonis/Lucid/Orm'
import { getWeather } from 'App/Services/WeatherService'
import User from './User'

export default class Meeting extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public title: string

  @column()
  public place: string

  @column()
  public description: string

  @column()
  public admin_id: number

  @column.dateTime({ serializeAs: null })
  public date: DateTime

  @column.dateTime({ autoCreate: true, serializeAs: null })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true, serializeAs: null })
  public updatedAt: DateTime

  @computed()
  public get dateFormatted() {
    return this.date.toFormat('dd/MM/yyyy')
  }

  @column()
  public weather: any;

  @afterFetch()
  public static async getWeather(meetings: Meeting[]) {
    await Promise.all(
      meetings.map(async (meeting) => {
        await meeting.load('users')
        try {
          meeting.weather = await getWeather(meeting.place)
        } catch(error) {
          meeting.weather = Promise.call('')
        }
        return meeting
      })
    )
  }

  @afterFind()
  public static async getSingleWeather(meeting: Meeting) {
    meeting.weather = await getWeather(meeting.place)
    return meeting
  }
  public async getWeather() {
    return getWeather(this.place)
  }

  @manyToMany(() => User)
  public users: ManyToMany<typeof User>
}
