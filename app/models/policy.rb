class Policy < ApplicationRecord
    belongs_to :client
    has_many :coverages
end
