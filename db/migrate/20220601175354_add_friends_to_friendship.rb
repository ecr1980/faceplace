class AddFriendsToFriendship < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :befriendor_id, :integer
    add_column :friendships, :befriendee_id, :integer
    add_column :friendships, :confirmed, :boolean
  end
end
