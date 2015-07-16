class AuthorController < BackendController
  def delete
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params_filter)
    if @author.save
      flash[:notice] = 'Author created'
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params_filter)
      flash[:notice] = 'Author updated'
    end
    render('edit')
  end

  def destroy
    author = Author.find(params[:id])
    if Author.count > 0
      if author.id != session[:user_id] && author.username != session[:username]
        Author.find(params[:id]).destroy
        flash[:notice] = 'Author destroyed'
      else
        flash[:notice] = 'Cannot delete currently logged in author'
      end
    else
      flash[:notice] = 'Cannot delete only author'
    end
    redirect_to(:action => 'index')
  end

  protected
    def id?
      author = Author.where(:id => params[:id]).first
      super(author, 'That author does not exist')
    end

  private
    def params_filter
      params.require(:author).permit(:first, :last, :email, :username, :password, :password_confirmation)
    end
end
