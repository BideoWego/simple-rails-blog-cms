class PostController < BackendController
  def delete
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(params_filter)
    @post.author = Author.find(session[:user_id])
    if @post.save
      flash[:notice] = 'Post created'
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params_filter)
      flash[:notice] = 'Post updated'
    end
    render('edit')
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = 'Post destroyed'
    redirect_to(:action => 'index')
  end

  protected
    def id?
      post = Post.where(:id => params[:id]).first
      super(post, 'That post does not exist')
    end

  private
    def params_filter
      params.require(:post).permit(:title, :content)
    end
end
