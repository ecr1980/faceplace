class AddTextToSayings < ActiveRecord::Migration[7.0]
  def change
    add_column :sayings, :body, :text
  end
end
