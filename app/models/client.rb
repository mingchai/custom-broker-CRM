class Client < ApplicationRecord
    has_many :policies, dependent: :destroy
    validates :email,
    presence: true, 
    uniqueness: true, 
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    after_validation :geocode

    def full_name
        "#{first_name} #{last_name}".strip
    end

    def full_address
        [street_address, city, province, postal_code].compact.join(', ')
    end

    geocoded_by :full_address
end
