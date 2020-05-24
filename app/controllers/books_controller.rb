class BooksController < ApplicationController
  before_action :set_current_user
  # before_action :set_tweet, only: [:edit, :show]
  # before_action :move_to_index, except: [:index, :show, :search]
  before_action :authenticate_user!
  # before_action :set_user
  # before_action :authenticate_user!, only: [:show]

  def index
    @books = Book.page(params[:page]).per(15).order(created_at: :desc)
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
    @book = Book.new(book_params)
    # binding.pry
    if @book.save
      flash.now[:notice] = '本が登録されました。'
      redirect_to books_path
    else
      flash.now[:alert] = '本の情報を入力してください。'
      render :new
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)
  end


  def edit
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)
  end


  def update
    book = Book.find(params[:id])
    book.update(book_params)
    @book = Book.find_by(id: params[:id])
    if @book.update(book_params)
      flash.now[:notice] = '本が編集されました。'
      redirect_to books_path
    else
      flash.now[:alert] = '削除に失敗しました。'
      redirect_to edit_book_path(params[:id])
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash.now[:notice] = '本が削除されました。'
    redirect_to books_path
    # @book = Book.find_by(id: params[:id])
    # if @book.destroy
    #   flash.now[:notice] = '本が削除されました。'
    #   redirect_to books_path
    # else
    #   redirect_to edit_book_path(@book.id)
    # end
  end


  def search
    @books = Book.search(params[:keyword])
    @books = Book.page(params[:page]).per(18).order(created_at: :desc)
    # @books = Book.page(params[:page]).order(created_at: :desc)
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


