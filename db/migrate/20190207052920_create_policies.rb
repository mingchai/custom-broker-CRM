class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|
      t.string "policy_number", index: {unique: true}
      t.float "annual_premium"
      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
