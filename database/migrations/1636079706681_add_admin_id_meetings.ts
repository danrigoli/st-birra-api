import BaseSchema from '@ioc:Adonis/Lucid/Schema'

export default class Meetings extends BaseSchema {
  protected tableName = 'meetings'

  public async up () {
    this.schema.alterTable(this.tableName, (table) => {
      table.integer('admin_id').unsigned().references('id').inTable('users').onDelete('CASCADE')
    })
  }

  public async down () {
    this.schema.alterTable(this.tableName, (table) => {
      table.dropColumn('admin_id')
      table.dropForeign('admin_id')
    })
  }
}
