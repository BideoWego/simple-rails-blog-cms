class PublicController < ApplicationController
  def index
  	@posts = Post.recent
  end
end
