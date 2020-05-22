class BooksController < ApplicationController
  before_action :set_current_user
  # before_action :set_tweet, only: [:edit, :show]
  # before_action :move_to_index, except: [:index, :show, :search]
  before_action :authenticate_user!
  # before_action :set_user
  # before_action :authenticate_user!, only: [:show]

  def index
    @books = Book.page(params[:page]).order(created_at: :asc)
    # @books = Book.includes(:images).order('created_at DESC').limit(3)
    # @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    # @books = Book.all
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
    if @book.save!
      flash.now[:notice] = '本が登録されました。'
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
  end

  def show
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)
  end


  def edit
    @book = Book.find(id: params[:id])
  end


  def update
    book = Book.find(params[:id])
    book.update(book_params)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
  end


  def search
    @books = Book.search(params[:keyword])
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
      :title,
      :image,
      :author,
      :publisher,
      :status,
      :genre,
      :item,
      :memo,
      :impression,
      :evaluation,
      :buy_date,
    ).merge(user_id: current_user.id)
    # params.require(:book).permit(:content, :image).merge(user_id: current_user.id)
  end

  # def set_books
  #   @book = Book.find(params[:id])
  # end  

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
    # @user = User.find(params[:user_id])
  end

end


