class ChangeCityInUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :city, :string if column_exists?(:users, :city)
    # Ne pas ajouter city_id si elle existe déjà
    add_reference :users, :city, foreign_key: true unless column_exists?(:users, :city_id)
  end
end
