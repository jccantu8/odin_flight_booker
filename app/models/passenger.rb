class Passenger < ApplicationRecord
    has_one :flight, through: :booking
    belongs_to :booking
end
