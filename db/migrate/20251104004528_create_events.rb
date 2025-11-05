class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :event_date
      t.string :location
      t.json :image

      t.timestamps
    end
  end
end
