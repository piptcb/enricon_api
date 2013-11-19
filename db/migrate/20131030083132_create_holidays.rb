class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.references :country, index: true
 
      t.timestamps
    end
  end
end
