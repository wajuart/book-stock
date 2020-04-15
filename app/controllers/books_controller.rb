class BooksController < ApplicationController
  before_action :set_user

  def index
    # @register = Register.new
    # @registers = @user.registers.includes(:user)
  end

  def new
  end  

  def create
    @book = @user.books.new(book_params)
    if @book.save
      redirect_to user_books_path(@user), notice: '本が登録されました。'
    else
      @books = @user.books.includes(:user)
      flash.now[:alert] = '本のタイトルまたは画像を入力してください。'
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def book_params
    params.require(:book).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_user
    # @user = User.find(params[:user_id])
  end

end

