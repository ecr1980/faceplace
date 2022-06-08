class AddIndexesToThose < ActiveRecord::Migration[7.0]
  def change
  end
  add_index :comments, [:commentable_type, :commentable_id]
  add_index :likes, [:likable_type, :likable_id]
end
