class CreatePolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :policies do |t|

      t.timestamps
    end
  end
end
