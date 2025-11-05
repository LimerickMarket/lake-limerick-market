class CreatePromos < ActiveRecord::Migration[7.1]
  def change
    create_table :promos do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.json :image

      t.timestamps
    end
  end
end
