class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :twitter
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
