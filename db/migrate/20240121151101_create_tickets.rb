class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.timestamps
      t.string :title
      t.text :description
      t.integer :assigned_user_id
      t.date :due_date
      t.integer :status_id
      t.integer :progress
    end
  end
end
