class AddCategoryToNewsStories < ActiveRecord::Migration
  def change
    add_column :news_stories, :category, :string
  end
end
