class Client < ApplicationRecord
    has_many :policies
    validates :email,
    presence: true, 
    uniqueness: true, 
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    def full_name
        "#{first_name} #{last_name}".strip
    end
end
