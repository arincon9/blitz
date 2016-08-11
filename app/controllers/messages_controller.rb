class MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)

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
		params.require(:message).permit(:name, :phone_number, :images)
	end

end
