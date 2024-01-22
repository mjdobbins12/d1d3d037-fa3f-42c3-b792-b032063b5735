class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :name
      t.string :email
      t.integer :send_due_date_reminder, limit: 2
      t.integer :due_date_reminder_interval
      t.time :due_date_reminder_time
      t.string :timezone
    end
  end
end
