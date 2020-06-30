class CreateTableNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.boolean :viewed, default: false
      t.string :family
      t.string :message
      t.integer :what
      t.integer :who
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
