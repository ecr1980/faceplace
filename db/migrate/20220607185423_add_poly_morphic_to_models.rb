class AddPolyMorphicToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    add_column :likes, :likable_id, :integer
    add_column :likes, :likable_type, :string
  end


end
