class RenameColumnTravelerPasswordToHashedPassword < ActiveRecord::Migration
  def self.up
    rename_column :travelers, :password, :hashed_password
    change_column(:travelers, :hashed_password, :string)
  end

  def self.down
    rename_column :travelers, :hashed_password, :password
    change_column(:travelers, :password, :string, :limit => 20)
  end
end
