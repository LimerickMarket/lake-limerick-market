class CreateNewsletterTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :newsletter_templates do |t|
      t.string :name, null: false
      t.string :template_type, null: false # 'weekly_deals' or 'event_notifications'
      t.string :subject, null: false
      t.text :body, null: false
      t.string :cadence, default: 'weekly' # weekly, monthly, yearly, manual
      t.boolean :active, default: true, null: false
      t.datetime :last_sent_at

      t.timestamps
    end
    
    add_index :newsletter_templates, :template_type
    add_index :newsletter_templates, :active
  end
end
