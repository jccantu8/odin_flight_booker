class BookingsController < ApplicationController
    def new
        @chosen_flight = Flight.find_by(:id => params[:chosen_flight])
        @number_of_passengers = params[:number_of_passengers]

        @booking = Booking.new
        @number_of_passengers.to_i.times { @booking.passengers.build }
    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save
            render 'show'
        else
            render 'new'
        end
    end

    def show
        @booking = Booking.find_by(:id => params[:id])
    end

    private

        def booking_params
            params.require(:booking).permit(:flight_id, :passengers_attributes => [:name, :email])
        end
end
