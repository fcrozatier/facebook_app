class ChangeNotificationWhoType < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :who
    add_column :notifications, :who, :integer
  end
end
