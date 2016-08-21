class BingInterface
	def self.return_image_urls(keyword, size)
		client = BingSearch::Client.new(account_key: ENV["BING_SEARCH_ACCOUNT_KEY"])

		image_results = client.image(keyword)
		image_urls = []

		image_results.each do |image|
			image_urls << image.media_url
		end

		sample = image_urls.sample(size)

		return sample
	end
end
