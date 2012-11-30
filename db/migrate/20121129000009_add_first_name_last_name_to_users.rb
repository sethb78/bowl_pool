class AddFirstNameLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :FirstName, :string
    add_column :users, :LastName, :string
    remove_column :users, :name, :string
  end
end
