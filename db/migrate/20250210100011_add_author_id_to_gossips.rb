class AddAuthorIdToGossips < ActiveRecord::Migration[6.0]
  def change
    add_column :gossips, :author_id, :integer
    add_foreign_key :gossips, :users, column: :author_id 
  end
end
