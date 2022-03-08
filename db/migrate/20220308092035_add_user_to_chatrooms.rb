class AddUserToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :user_connected, references: :users, index: true
    add_reference :chatrooms, :user_messaged, references: :users, index: true
  end
end
