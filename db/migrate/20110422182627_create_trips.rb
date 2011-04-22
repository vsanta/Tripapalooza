class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :name, null: false
      t.string :destination, null: false
      t.float :destination_lat, :precision => 15, :scale => 10
      t.float :destination_lon, :precision => 15, :scale => 10
      t.date :start
      t.date :end
      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
