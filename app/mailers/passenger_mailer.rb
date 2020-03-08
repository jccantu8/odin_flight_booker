class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def booking_success_email
        @users = params[:passengers]

        @users.each do |user|
            @user = Passenger.find_by(:id => user)
            @url = "http://localhost:3000/bookings/#{@user.booking.id}"
            mail(to: @user.email, subject: 'You are booked!')
        end
        
    end
end
