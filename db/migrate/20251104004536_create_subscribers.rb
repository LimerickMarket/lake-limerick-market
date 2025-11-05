class CreateSubscribers < ActiveRecord::Migration[7.1]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :name
      t.datetime :subscribed_at

      t.timestamps
    end
  end
end
