class AddPersonToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :region, :string
    add_column :users, :address, :string
    add_column :users, :phone_number1, :string
    add_column :users, :phone_number2, :string
  end
end
