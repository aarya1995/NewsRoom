class NewsStory < ActiveRecord::Base
	
	def self.update_from_feed(feed_url)
        
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
	
		if feed_url.include? "news/world"
	    	add_world_entries(feed.entries)
		elsif feed_url.include? "news/politics"
	    	add_politics_entries(feed.entries)
		elsif feed_url.include? "news/technology"
	    	add_tech_entries(feed.entries)
	    elsif feed_url.include? "news/rss.xml"
	    	add_top_entries(feed.entries)
		end
    end


 private

 #terribly redundant code, only difference btween methods is
 #the category. How to do this in one method???
  
  def self.add_world_entries(entries)
    entries.each do |entry|

      unless exists? :guid => entry.id
      	if entry.title.include? "VIDEO:"
      		#do nothing
        elsif entry.title.include? "AUDIO:"
          #do nothing
      	else
	        create!(
	          :name         => entry.title, 
	          :summary      => entry.summary,
	          :url          => entry.url,
	          :published_at => entry.published,
	          :guid         => entry.id,
	          :category 	=> "world"
	        )
		    end
      end
    end
  end

  def self.add_politics_entries(entries)
    entries.each do |entry|

      unless exists? :guid => entry.id
      	if entry.title.include? "VIDEO:"
      		#do nothing
      	else
	        create!(
	          :name         => entry.title, 
	          :summary      => entry.summary,
	          :url          => entry.url,
	          :published_at => entry.published,
	          :guid         => entry.id,
	          :category 	=> "politics"
	        )
		end
      end
    end
  end

  def self.add_tech_entries(entries)
    entries.each do |entry|

      unless exists? :guid => entry.id
      	if entry.title.include? "VIDEO:"
      		#do nothing
      	else
	        create!(
	          :name         => entry.title, 
	          :summary      => entry.summary,
	          :url          => entry.url,
	          :published_at => entry.published,
	          :guid         => entry.id,
	          :category 	=> "tech"
	        )
		end
      end
    end
  end

  def self.add_top_entries(entries)
    entries.each do |entry|

      unless exists? :guid => entry.id
      	if entry.title.include? "VIDEO:"
      		#do nothing
      	else
	        create!(
	          :name         => entry.title, 
	          :summary      => entry.summary,
	          :url          => entry.url,
	          :published_at => entry.published,
	          :guid         => entry.id,
	          :category 	=> "top"
	        )
		end
      end
    end
  end
end

