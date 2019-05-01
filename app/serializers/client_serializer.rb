class ClientSerializer < ActiveModel::Serializer
  attributes :id,
   :first_name,
   :last_name,
   :phone_number,
   :email,
   :street_address,
   :city,
   :province,
   :postal_code,
   :marketing_consent,
   :user_id

   has_many(:policies)

   class PolicySerializer < ActiveModel::Serializer
    attributes :id, :annual_premium, :client_id, :created_at, :updated_at, :start_date, :expiry_date, :stripe_charge_id
    belongs_to(:client)
  end
end
