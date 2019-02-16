class CreateFireHalls < ActiveRecord::Migration[5.2]
  def change
    create_table :fire_halls do |t|
      t.string :address
      t.string :fire_hall_name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
