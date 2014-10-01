class StoriesController < ApplicationController
  def index
  	@stories = NewsStory.all
  end
end
