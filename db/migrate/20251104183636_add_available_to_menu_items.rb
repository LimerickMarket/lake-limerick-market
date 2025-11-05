class AddAvailableToMenuItems < ActiveRecord::Migration[7.1]
  def change
    add_column :menu_items, :available, :boolean, default: true, null: false
  end
end
