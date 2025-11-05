class FixSubscriberSchema < ActiveRecord::Migration[7.1]
  def change
    # Remove the name column and add first_name, last_name, and preference columns
    remove_column :subscribers, :name, :string
    add_column :subscribers, :first_name, :string
    add_column :subscribers, :last_name, :string
    add_column :subscribers, :weekly_deals, :boolean, default: true
    add_column :subscribers, :event_notifications, :boolean, default: true
  end
end
