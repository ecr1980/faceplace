class AddUserToSaying < ActiveRecord::Migration[7.0]
  def change
    add_column :sayings, :user_id, :integer
  end
end
