require 'date'

AIRPORTS = {"Houston" => "IAH", "San Francisco" => "SFO", "New York City" => "NYC", "Orlando" => "MCO"}

AIRPORTS_IDS = {"Houston" => 1, "San Francisco" => 2, "New York City" => 3, "Orlando" => 4}

DURATIONS = {"Houston" =>       {"San Francisco"=> 13140, "New York City"=> 12240, "Orlando"=> 6540},
             "San Francisco"=> {"Houston"=> 13140, "New York City"=> 18000, "Orlando"=> 16860},
             "New York City"=> {"Houston"=> 12240, "San Francisco"=> 18000, "Orlando"=> 8040},
             "Orlando"=>       {"Houston"=> 6540, "San Francisco"=> 16860, "New York City"=> 8040}}

AIRPORTS.keys.each do |x|
    Airport.create( id: AIRPORTS_IDS[x], name: x, abbreviation: AIRPORTS[x] )
end


10.times do
    incoming_airport_id, outgoing_airport_id = nil, nil

    loop do
        incoming_airport_id = rand(4)+1
        outgoing_airport_id = rand(4)+1

        break if outgoing_airport_id != incoming_airport_id
    end

    outgoing = AIRPORTS_IDS.key(outgoing_airport_id)
    incoming = AIRPORTS_IDS.key(incoming_airport_id)
    duration = DURATIONS[outgoing][incoming]
    start = (Date.today - (rand * 28))

    Flight.create( from_airport_id: incoming_airport_id, to_airport_id: outgoing_airport_id, start:start, duration: duration)
end