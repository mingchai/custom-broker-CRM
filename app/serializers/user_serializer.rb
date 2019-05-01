class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :full_name, :email, :admin, :created_at, :updated_at
  has_many(:clients)
end