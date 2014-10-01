task :getimg => :environment do

	require 'open-uri'
	stories = NewsStory.all

	stories.each do |story|
	
		url = story.url

		doc = Nokogiri::HTML(open(url))

		if doc.at_css(".full-width img")
			img = doc.at_css(".full-width img")[:src]
			story.image = img
			story.save!
		elsif doc.at_css(".body-width img")
			img = doc.at_css(".body-width img")[:src]
			story.image = img
			story.save!
		elsif doc.at_css(".body-narrow-width img")
			img = doc.at_css(".body-narrow-width img")[:src]
			story.image = img
			story.save!
		elsif doc.at_css(".caption img")
			img = doc.at_css(".caption img")[:src]
			story.image = img
			story.save!
		end
	end
end

