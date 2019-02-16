class AddDateColumnsToPolicies < ActiveRecord::Migration[5.2]
  def change
    add_column :policies, :start_date, :date
    add_column :policies, :expiry_date, :date
  end
end
