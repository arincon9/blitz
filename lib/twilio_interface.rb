class TwilioInterface
	def self.send_message(to_number, body, media_url)
		@client = Twilio::REST::Client.new

		if body.nil?
			@client.messages.create(
				from: ENV["twilio_app_number"],
				to: to_number.to_s,
				media_url: media_url
				)
			else
				@client.messages.create(
					from: ENV["twilio_app_number"],
					to: to_number.to_s,
					body: body
					)
				end

	end
end
