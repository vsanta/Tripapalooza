class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :name, null: false
      t.string :destination, null: false
      t.decimal :destination_lat
      t.decimal :destination_lon
      t.date :start
      t.date :end
      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
