class Message < ApplicationRecord
	validates :name, 								presence: 	true
	validates :phone_number, presence: 	 true,
																						phone: 				true
	validates :images, 							presence:  true
end
