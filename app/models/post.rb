class Post < ActiveRecord::Base
	belongs_to :author
	has_many :comments
	validates :title, :presence => true
	validates :content, :presence => true
	after_destroy :destroy_comments

	scope :recent, lambda {order('posts.created_at DESC')}

	def excerpt
		content.truncate_words(25)
	end

	def destroy_comments
		comments.destroy_all
	end
end
