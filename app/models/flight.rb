class Flight < ApplicationRecord
    belongs_to :to_airport, class_name: "Airport"
    belongs_to :from_airport, class_name: "Airport"
    has_many :bookings

    scope :filter, -> (params) { where("from_airport_id = ?
                                      AND to_airport_id = ?
                                      AND   start = ?",
                                     params[:from_airport_id], 
                                     params[:to_airport_id],
                                     params[:flight_date].to_datetime) }

    def date_formatted
        self.start.strftime("%m/%d/%Y")
    end
end