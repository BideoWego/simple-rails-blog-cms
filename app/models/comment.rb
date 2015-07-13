class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :author
	validates :content, :presence => true

	def excerpt
		content.truncate_words(5)
	end
end
