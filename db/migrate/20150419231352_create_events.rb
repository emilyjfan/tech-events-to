class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
