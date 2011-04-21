class CreateTravelers < ActiveRecord::Migration
  def self.up
    create_table :travelers do |t|
      t.string :nick, limit: 20, unique: true, null: false
      t.string :email, limit: 50, unique: true, null: false
      t.string :password, limit: 20, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :travelers
  end
end
