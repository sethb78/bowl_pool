class AddEmailConfirmationMiddleInitialCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :middle_initial, :string
    add_column :users, :email_confirmation, :string
    add_column :users, :country, :string
  end
end
