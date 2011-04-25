class AddColumnSaltToTraveler < ActiveRecord::Migration
  def self.up
    add_column :travelers, :salt, :string, :null => false
  end

  def self.down
    remove_column :travelers, :salt
  end
end
