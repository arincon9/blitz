class BingInterface
	def self.return_image_urls(keyword, size)
		image_results = BingSearch.image(keyword, limit: size)
		image_urls = []

		image_results.each do |image|
			image_urls << image.media_url
		end

		return image_urls
	end
end
