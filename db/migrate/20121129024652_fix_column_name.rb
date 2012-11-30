class FixColumnName < ActiveRecord::Migration
	def change
    	change_table :users do |t|
	      	t.rename :FirstName, :first_name
	      	t.rename :LastName, :last_name
  		end
	end
end
