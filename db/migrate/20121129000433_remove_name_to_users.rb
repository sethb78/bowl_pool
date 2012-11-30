class RemoveNameToUsers < ActiveRecord::Migration
  def up
  end

  def self.down
  	    remove_column :users, :name, :varchar

  end
end
