class AddFriendReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :friend, foreign_key: true
  end
end
