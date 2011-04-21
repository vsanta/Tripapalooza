class CreateTravellers < ActiveRecord::Migration
  def self.up
    create_table :travellers do |t|
      t.string :name, limit: 20
      t.string :email, limit: 50
      t.string :password, limit: 20
      t.timestamps
    end
  end

  def self.down
    drop_table :travellers
  end
end
