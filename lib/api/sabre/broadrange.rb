module Api
  module Sabre
    class Broadrange

    	def self.flights(origin, destination)

				auth = { 'Authorization' => Figaro.env.sabre_auth_key, 'Content-Type' => 'application/json' }
				url = "https://api.test.sabre.com/v1.8.1/shop/calendar/flights"


				request = {
    "OTA_AirLowFareSearchRQ" => {
        "OriginDestinationInformation" => [
            {
                "DepartureDates" => {
                    "dayOrDaysRange" => [
                        {
                            "DaysRange" => {
                                "FromDate" => "2015-08-01",
                                "ToDate" => "2015-08-28"
                            }
                        }
                    ]
                },
                "DestinationLocation" => {
                    "LocationCode" => "LAX"
                },
                "OriginLocation" => {
                    "LocationCode" => "DFW"
                },
                "RPH" => 1
            },
            {
                "DepartureDates" => {
                    "lengthOfStayOrLengthOfStayRange" => [
                        {
                            "LengthOfStayRange" => {
                                "MaxDays" => 1,
                                "MinDays" => 1
                            }
                        }
                    ]
                },
                "DestinationLocation" => {
                    "LocationCode" => "DFW"
                },
                "OriginLocation" => {
                    "LocationCode" => "LAX"
                },
                "RPH" => 2
            }
        ],
        "POS" => {
            "Source" => [
                {
                    "RequestorID" => {
                        "CompanyName" => {
                            "Code" => "TN"
                        },
                        "ID" => "REQ.ID",
                        "Type" => "0.AAA.X"
                    }
                }
            ]
        },
        "TPA_Extensions" => {
            "IntelliSellTransaction" => {
                "RequestType" => {
                    "Name" => "ADC1000"
                }
            }
        },
        "TravelPreferences" => {
            "TPA_Extensions" => {
                "NumTrips" => {
                    "Number" => 200
                }
            }
        },
        "TravelerInfoSummary" => {
            "AirTravelerAvail" => [
                {
                    "PassengerTypeQuantity" => [
                        {
                            "Code" => "ADT",
                            "Quantity" => 1
                        }
                    ]
                }
            ],
            "PriceRequestInformation" => {
                "TPA_Extensions" => {
                    "Priority" => {
                        "DirectFlights" => {
                            "Priority" => 2
                        },
                        "Price" => {
                            "Priority" => 1
                        },
                        "Time" => {
                            "Priority" => 3
                        },
                        "Vendor" => {
                            "Priority" => 4
                        }
                    }
                }
            }
        }
    }
}.to_json


				response = HTTParty.post(url, body: request, headers: auth)
				return response
    	end

    end
   end
 end



