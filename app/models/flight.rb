class Flight < ApplicationRecord
    belongs_to :to_airport, class_name: "Airport"
    belongs_to :from_airport, class_name: "Airport"

    scope :filter, -> (params) { where("from_airport_id = ?", params[:from_airport_id]) }

    def date_formatted
        self.start.strftime("%m/%d/%Y")
    end
end