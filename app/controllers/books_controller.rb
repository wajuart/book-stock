class BooksController < ApplicationController
  before_action :set_current_user
  # before_action :set_tweet, only: [:edit, :show]
  # before_action :move_to_index, except: [:index, :show, :search]
  before_action :authenticate_user!, only: [:create]
  # before_action :set_user
  # before_action :authenticate_user!, only: [:show]

  def index
    # @books = Book.page(params[:page]).per(15).order(created_at: :desc)
    @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(15)
    @book = Book.new
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
      redirect_to books_path(@book), notice: '本が登録されました'
    else
      flash.now[:alert] = '本の情報を正しく入力してください。'
      render :new
    end
  end

  def show
    # @book = Book.find_by(id: params[:id])
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
    # @comments = @book.comments
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
    # @like = Like.find_by(user_id: current_user.id, book_id: params[:id]) if user_signed_in?
    # @like = Like.new
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
      redirect_to books_path(@book), notice: '本が更新されました'
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    # book.destroy(book_params)
    # @book = Book.find_by(id: params[:id])
    redirect_to books_path(@book), notice: '本が削除されました'
    # if @book.destroy
    #   redirect_to books_path(@book), notice: '本が削除されました'
    # else
    #   flash.now[:alert] = '削除に失敗しました。'
    #   render :edit
    # end
  end


  def search
    @books = Book.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(24)
    # @books = Book.page(params[:page]).per(18).order(created_at: :desc)
    # @books = Book.page(params[:page]).order(created_at: :desc)
  end

  # ジャンル別
  def genre_all
    @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(15)
  end

  def business
    @books = Book.where(genre: 'ビジネス').page(params[:page]).per(15).order(created_at: :desc)
  end

  def self_enlightenment
    @books = Book.where(genre: '自己啓発').page(params[:page]).per(15).order(created_at: :desc)
  end

  def money
    @books = Book.where(genre: 'マネー').page(params[:page]).per(15).order(created_at: :desc)
  end

  def politics_economy
    @books = Book.where(genre: '政治／経済').page(params[:page]).per(15).order(created_at: :desc)
  end

  def study_skill
    @books = Book.where(genre: '勉強／スキル').page(params[:page]).per(15).order(created_at: :desc)
  end

  def cooking
    @books = Book.where(genre: '料理').page(params[:page]).per(15).order(created_at: :desc)
  end

  def hobby
    @books = Book.where(genre: '趣味').page(params[:page]).per(15).order(created_at: :desc)
  end

  def health
    @books = Book.where(genre: '健康').page(params[:page]).per(15).order(created_at: :desc)
  end

  def sports
    @books = Book.where(genre: 'スポーツ').page(params[:page]).per(15).order(created_at: :desc)
  end

  def entertainment
    @books = Book.where(genre: '芸能').page(params[:page]).per(15).order(created_at: :desc)
  end

  def parenting
    @books = Book.where(genre: '子育て').page(params[:page]).per(15).order(created_at: :desc)
  end

  def novel
    @books = Book.where(genre: '小説').page(params[:page]).per(15).order(created_at: :desc)
  end

  def comic
    @books = Book.where(genre: '漫画').page(params[:page]).per(15).order(created_at: :desc)
  end

  def life
    @books = Book.where(genre: '生活').page(params[:page]).per(15).order(created_at: :desc)
  end

  def genre_etc
    @books = Book.where(genre: 'その他').page(params[:page]).per(15).order(created_at: :desc)
  end


  # ★評価別
  def evaluation_all
    @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(15)
  end

  def evaluation_five
    # books = @book = Book.where(user_id: params[:id]).all
    @books = Book.where(evaluation: '⭐️⭐️⭐️⭐️⭐️').page(params[:page]).per(15).order(created_at: :desc)
  end

  def evaluation_four
    @books = Book.where(evaluation: '⭐️⭐️⭐️⭐️☆').page(params[:page]).per(15).order(created_at: :desc)
  end

  def evaluation_three
    @books = Book.where(evaluation: '⭐️⭐️⭐️☆☆').page(params[:page]).per(15).order(created_at: :desc)
  end

  def evaluation_two
    @books = Book.where(evaluation: '⭐️⭐️☆☆☆').page(params[:page]).per(15).order(created_at: :desc)
  end

  def evaluation_one
    @books = Book.where(evaluation: '⭐️☆☆☆☆').page(params[:page]).per(15).order(created_at: :desc)
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


