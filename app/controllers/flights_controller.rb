class FlightsController < ApplicationController
    def index
        @airports = Airport.all.map{ |x| [ x.name, x.id ] }
        @number_of_passengers = (1..4).to_a
        @flight_date = Flight.all.map{ |x| [x.date_formatted, x.start] }

        if params[:search]
            @eligible_flights = Flight.filter(search_params)
            @chosen_number_of_passengers = search_params[:number_of_passengers]
        end
    end

    private

        def search_params
            params.require(:search).permit(:from_airport_id, :to_airport_id, :number_of_passengers, :flight_date)
        end
end
