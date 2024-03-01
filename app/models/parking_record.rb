class ParkingRecord < ApplicationRecord
    belongs_to :vehicle
    belongs_to :payment_transaction, optional: true
    belongs_to :parking_lot
end
