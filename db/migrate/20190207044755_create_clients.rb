class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email, index: true
      t.string :street_address
      t.string :city
      t.string :province
      t.string :postal_code
      t.boolean :marketing_consent
      t.integer :broker_id

      t.timestamps
    end
  end
end
