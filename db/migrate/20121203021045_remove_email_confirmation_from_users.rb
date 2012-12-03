class RemoveEmailConfirmationFromUsers < ActiveRecord::Migration
  def up
  	    remove_column :users, :email_confirmation

  end

  def down
  end
end
