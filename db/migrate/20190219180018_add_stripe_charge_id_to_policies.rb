class AddStripeChargeIdToPolicies < ActiveRecord::Migration[5.2]
  def change
    add_column :policies, :stripe_charge_id, :string
  end
end
