class UsersController < ApplicationController
  # before_action :set_user, only: [:index, :my_page, :edit, :profile_edit, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    @user.image = "default.png"
    if @user.save
      flash[:success] = '新しいユーザーを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end

  def show
    # user = User.find(params[:id])
    @user = User.find(params[:id])
    # @books = Book.find(params[:id])
    @books = @user.books
    books = @book = Book.where(user_id: params[:id]).all
    # @user = User.where(user_id: current_user.id)
  end

  def my_page
    # @books = Book.page(params[:page]).order(created_at: :asc)
    # @books = Book.user.book.order(created_at: :asc)
    @books = current_user.books.page(params[:page]).per(12).order(created_at: :desc)
    # @user = User.find(params[:id])
    # @user = User.where(user_id: current_user.id)
    books = @book = Book.where(user_id: params[:id]).all
    # @book_cnt = books.count
  end

  def my_books_show
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def edit
    @user = User.find(params[:id])
  end  
  
  def profile_edit
    @user = User.find(params[:id])
  end  

  def update
    @user = User.find(params[:id])
    # @user.image = "default_icon.png"
    if current_user.update(user_params)
      redirect_to my_page_user_path(current_user), notice: 'プロフィールが更新されました'
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  # def counts(user)  
  #   # books = @book = Book.where(user_id: params[:id]).all  
  #   # @book_cnt = books.count
  # end

  def all_books
    @books = current_user.books.page(params[:page]).per(12).order(created_at: :desc)
  end

  # ステータス別
  def read_books
    @books = current_user.books.where(status: '読書済み').page(params[:page]).per(12).order(created_at: :desc)
  end

  def reading_books
    @books = current_user.books.where(status '読書中').page(params[:page]).per(12).order(created_at: :desc)
  end

  def will_read_books
    @books = current_user.books.where(status: '未読').page(params[:page]).per(12).order(created_at: :desc)
  end

  def interested
    @books = current_user.books.where(status: '興味あり').page(params[:page]).per(12).order(created_at: :desc)
  end

  # ジャンル別
  def business
    @books = current_user.books.where(genre: 'ビジネス').page(params[:page]).per(12).order(created_at: :desc)
    # @books = Book.where(genre: 'ビジネス').page(params[:page]).per(12).order(created_at: :desc)
  end

  def self_enlightenment
    @books = current_user.books.where(genre: '自己啓発').page(params[:page]).per(12).order(created_at: :desc)
  end

  def money
    @books = current_user.books.where(genre: 'マネー').page(params[:page]).per(12).order(created_at: :desc)
  end

  def politics_economy
    @books = current_user.books.where(genre: '政治／経済').page(params[:page]).per(12).order(created_at: :desc)
  end

  def study_skill
    @books = current_user.books.where(genre: '勉強／スキル').page(params[:page]).per(12).order(created_at: :desc)
  end

  def cooking
    @books = current_user.books.where(genre: '料理').page(params[:page]).per(12).order(created_at: :desc)
  end

  def hobby
    @books = current_user.books.where(genre: '趣味').page(params[:page]).per(12).order(created_at: :desc)
  end

  def health
    @books = current_user.books.where(genre: '健康').page(params[:page]).per(12).order(created_at: :desc)
  end

  def sports
    @books = current_user.books.where(genre: 'スポーツ').page(params[:page]).per(12).order(created_at: :desc)
  end

  def entertainment
    @books = current_user.books.where(genre: '芸能').page(params[:page]).per(12).order(created_at: :desc)
  end

  def parenting
    @books = current_user.books.where(genre: '子育て').page(params[:page]).per(12).order(created_at: :desc)
  end

  def novel
    @books = current_user.books.where(genre: '小説').page(params[:page]).per(12).order(created_at: :desc)
  end

  def comic
    @books = current_user.books.where(genre: '漫画').page(params[:page]).per(12).order(created_at: :desc)
  end

  def life
    @books = current_user.books.where(genre: '生活').page(params[:page]).per(12).order(created_at: :desc)
  end

  def genre_etc
    @books = current_user.books.where(genre: 'その他').page(params[:page]).per(12).order(created_at: :desc)
  end


  def real_book
    @books = current_user.books.where(item: 'リアル本').page(params[:page]).per(12).order(created_at: :desc)
  end

  def e_book
    @books = current_user.books.where(item: '電子書籍').page(params[:page]).per(12).order(created_at: :desc)
  end

  def paper_white
    @books = current_user.books.where(item: 'Paperwhite').page(params[:page]).per(12).order(created_at: :desc)
  end

  def audio_book
    @books = current_user.books.where(item: 'オーディオブック').page(params[:page]).per(12).order(created_at: :desc)
  end

  def item_etc
    @books = current_user.books.where(item: 'その他').page(params[:page]).per(12).order(created_at: :desc)
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :birth_day, :favorite_author, :favorite_genre, :favorite_book, :introduction)
  end

  def set_user
    @user = User.find_by(params[:id]) 
  end

#   def index
#     return nil if params[:keyword] == ""
#     @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
#     respond_to do |format|
#       format.html
#   end
# end 


end
