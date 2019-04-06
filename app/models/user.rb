class User < ApplicationRecord
    has_secure_password
    has_many :clients

    validates :email, :first_name, :last_name, presence: true
    
    validates :email, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    def full_name
        "#{first_name} #{last_name}".strip
    end
end