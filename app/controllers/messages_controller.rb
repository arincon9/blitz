class MessagesController < ApplicationController
	require_dependency 'bing_interface'
	require_dependency 'twilio_interface'
 require_dependency 'braintree_interface'

	def create
		@message = build_message

		respond_to do |format|
      if @message.present?
        format.html { redirect_to root_path, notice: "Message Blitz has been sent" }
        format.js
      else
        format.html { redirect_to root_path, alert: "Message Blitz was not sent" }
        format.js
      end
		end
	end

	private

	def message_params
		params.require(:message).permit(:name, :phone_number, :images, :bundle, :promo_code)
	end

	def search_size
		if params[:message][:bundle] == "10 Images: $0.99"
			search_size = 10
		elsif params[:message][:bundle] == "20 images: $1.99"
			search_size = 20
		else
			search_size = 30
		end
	end

	def build_message
		send_image_blitz

		send_text_message
	end

	def send_image_blitz
			image_urls.each do |media_url|
				::TwilioInterface.send_message(formatted_phone_number, body = nil, media_url)
		end
	end

	def send_text_message
		::TwilioInterface.send_message(formatted_phone_number, body, media_url = nil)
	end

	def formatted_phone_number
		"+1#{params[:message][:phone_number]}"
	end

	def body
		"You have been message blitzed by: #{params[:message][:name]}. Get them back at messageblitz.com"
	end

	def image_urls
		::BingInterface.return_image_urls(params[:message][:images], search_size)
	end

	def payment?
		::BraintreeInterface.make_payment(amount)
	end

	def amount
		if params[:message][:bundle] == "10 Images: $0.99"
			amount = 0.99
		elsif params[:message][:bundle] == "20 images: $1.99"
			amount = 1.99
		else
			amount = 2.99
		end
	end

end
