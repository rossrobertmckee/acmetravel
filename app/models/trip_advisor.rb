class TripAdvisor

	def self.awards_image_tiny(code)
		@code = code
		response = Api::Tripadvisor::Api.tripadvisor(@code)
		city_data = JSON.parse(response.body)
		award_data = city_data["awards"]
		if award_data != []
			award_data.each do |images|
				awards_image = images["images"]
			return awards_image["tiny"]
			end
		end
	end

	def self.awards_image_small(code)
		@code = code
		response = Api::Tripadvisor::Api.tripadvisor(@code)
		city_data = JSON.parse(response.body)
		award_data = city_data["awards"]
		if award_data != []
			award_data.each do |images|
				awards_image = images["images"]
			return awards_image["small"]
			end
		end
	end

end
