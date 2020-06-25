class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.boolean :viewed, default: false
      t.string :type
      t.string :who
      t.string :what
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
