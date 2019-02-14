class AddGeocodingFieldsToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :full_address, :string
    add_column :clients, :latitude, :float
    add_column :clients, :longitude, :float
  end
end
