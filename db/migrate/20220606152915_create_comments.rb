class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :saying_id
      t.integer :commentor_id
      t.text :body

      t.timestamps
    end
  end
end
