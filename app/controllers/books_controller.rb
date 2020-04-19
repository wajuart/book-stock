class BooksController < ApplicationController
  before_action :set_current_user

  def index
    @books = Book.all
    # @books = @books.includes(:user)
    # @books = @user.books.includes(:user)
  end

  def new
    @book = Book.new
  end  

  def create
    # @book = Book.new(
    #   content: params[:content],
    #   user_id: @current_user.id
    # )
    
    # binding.pry
    # params[:book][:buydate] = @buy_date.to_s
    @book = Book.new(book_params)
    # if params[:commit]
    #   @book.user = current_user
    # @book = Book.new(book_params)
    
    # respond_to do |format|
    # binding.pry
    if @book.save
      # notice = Notice.new
      # redirect_to user.books_path(@user), notice: '本が登録されました。'
      # redirect_to user_path(@book.user_id)
      render :index
    else
      # @books = @books.includes(:user)
      # @books = @user.books.includes(:user)
      flash.now[:alert] = '本の情報を入力してください。'
      # render :index
      # format.html { render :new }
      # render 'new'
      render :new
    end
    # @book = Book.new(book_params)

    # @book = @books.new(book_params)
    # if @book.save
    #   redirect_to books_path(@user), notice: '本が登録されました。'
    # else
    #   @books = @books.includes(:user)
    #   flash.now[:alert] = '本のタイトルまたは画像を入力してください。'
    #   render :index
    # end
  end

  def show
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def edit
  end

  def update
  end

  def delete
  end

  def ensure_correct_user
    @book = Book.find_by(id:params[:id])
    if @book.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/books/index")
    end  
  end

  # @book.genre = params[:book][:genre]

  private

  def book_params
    p "**********"
    p params
    params.require(:book).permit(
      :image,
      :title,
      :author,
      :status,
      :genre,
      :item,
      :buydate,
      :impression
    ).merge(user_id: current_user.id)
    params.require(:book).permit(:content, :image).merge(user_id: current_user.id)
  end

  # def set_books
  #   @book = Book.find(params[:id])
  # end  

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
    # @user = User.find(params[:user_id])
  end

end

