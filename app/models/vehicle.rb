class Vehicle < ApplicationRecord
    belongs_to :user
    belongs_to :vehicle_type, optional: true
    has_many :vehicle_descriptors
    has_many :parking_records
end
