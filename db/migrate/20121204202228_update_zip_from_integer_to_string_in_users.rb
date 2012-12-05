class UpdateZipFromIntegerToStringInUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :zip, :string
    end
  end

  def self.down
    change_table :users do |t|
      t.change :zip, :integer
    end
  end
end