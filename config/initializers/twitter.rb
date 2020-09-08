# Twitter Initializer
require 'twitter_factory'

TwitterFactory.configure({
    :consumer_key => ENV['TWITTER_CONSUMER_KEY'],
    :consumer_secret => ENV['TWITTER_CONSUMER_SECRET'],
    :access_token => ENV['TWITTER_ACCESS_TOKEN'],
    :access_token_secret => ENV['TWITTER_ACCESS_TOKEN_SECRET']
})
# binding.pry

module TwitterStream
	module Timeline
		def Config
			# @client = TweetStream::Client.new
		end
	end
end