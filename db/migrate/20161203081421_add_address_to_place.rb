class AddAddressToPlace < ActiveRecord::Migration
  def change
    remove_column :places, :Address, :string
    add_column :places, :address, :string
    add_column :places, :type, :string
    remove_column :users, :ship_address, :string
    remove_column :users, :ship_city, :string
    remove_column :users, :ship_region, :string
    remove_column :users, :PasswordDigest, :string
    remove_column :users, :user_name, :string
    remove_column :users, :official, :string
    remove_column :users, :person, :string
    remove_column :users, :donation, :string
    add_column :users, :address, :string
  end
end
