class RenameNotificationColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :notifications, :type, :family
  end
end
