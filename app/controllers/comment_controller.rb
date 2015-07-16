class CommentController < BackendController
  skip_before_action :logged_in?, :only => [:create]

  def delete
    @posts = Post.all
    @comment = Comment.find(params[:id])
  end

  def edit
    @post_count = Post.count
    @posts = Post.all
    @comment = Comment.find(params[:id])
  end

  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def new
    @post_count = Post.count
    @posts = Post.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(:post_id => params_filter[:post_id], :content => params_filter[:content])
    @comment.author = (session[:user_id]) ? Author.find(session[:user_id]) : Author.guest
    saved = @comment.save
    if saved
      flash[:notice] = 'Comment created'
    end
    if params_filter[:public]
      redirect_to(:controller => 'public', :action => 'index', :anchor => 'post-' + params_filter[:post_id])
    else
      if saved
          redirect_to(:action => 'index')
      else
        render('new')
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params_filter)
      flash[:notice] = 'Comment updated'
    end
    render('edit')
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = 'Comment destroyed'
    redirect_to(:action => 'index')
  end

  protected
    def id?
      comment = Comment.where(:id => params[:id]).first
      super(comment, 'That comment does not exist')
    end

  private
    def params_filter
      params.require(:comment).permit(:public, :post_id, :content)
    end
end
