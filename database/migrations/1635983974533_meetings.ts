import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Meetings extends BaseSchema {
  protected tableName = 'meetings'

  public async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id')
      table.string('title').notNullable()
      table.string('description').notNullable()
      table.string('place').notNullable()
      table.dateTime('date').notNullable()
      table.timestamps(true, true)
    })
  }

  public async down() {
    this.schema.dropTable(this.tableName)
  }
}
