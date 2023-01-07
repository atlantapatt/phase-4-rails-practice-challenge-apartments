class Apartment < ApplicationRecord
    has_many :tenants
    has_many :leases

    validates :number, presence: true
end
