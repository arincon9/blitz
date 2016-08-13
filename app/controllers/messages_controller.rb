class MessagesController < ApplicationController
	def create
		@message = build_message

		respond_to do |format|
      if @message.save
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
		params.require(:message).permit(:name, :phone_number, :images, :bundle)
	end

	def search_size
		if params[:bundle] == "10 Images: $0.99"
			search_size = 10
		elsif params[:bundle] == "20 images: $1.99"
			search_size = 20
		else
			search_size = 30
		end
	end

	def build_message
		#Twilio Implementation
	end

	def image_urls
		BingInterface.return_image_urls(params[:images], search_size)
	end

end
