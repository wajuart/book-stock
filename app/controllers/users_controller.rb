class UsersController < ApplicationController
  before_action :authenticate_user!

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
    @user = User.find(params[:id])
    @books = @user.books.order("created_at DESC").page(params[:page]).per(18)
    books = @book = Book.where(user_id: params[:id]).all
  end

  def my_page
    @books = current_user.books.page(params[:page]).per(15).order(created_at: :desc)
    books = @book = Book.where(user_id: params[:id]).all
    books = @book_1 = current_user.books.where(genre: 'ビジネス')
    books = @book_2 = current_user.books.where(genre: '自己啓発')
    books = @book_3 = current_user.books.where(genre: 'マネー')
    books = @book_4 = current_user.books.where(genre: '政治／経済')
    books = @book_5 = current_user.books.where(genre: '勉強／スキル')
    books = @book_6 = current_user.books.where(genre: '料理')
    books = @book_7 = current_user.books.where(genre: '趣味')
    books = @book_8 = current_user.books.where(genre: '健康')
    books = @book_9 = current_user.books.where(genre: 'スポーツ')
    books = @book_10 = current_user.books.where(genre: '芸能')
    books = @book_11 = current_user.books.where(genre: '子育て')
    books = @book_12 = current_user.books.where(genre: '小説')
    books = @book_13 = current_user.books.where(genre: '漫画')
    books = @book_14 = current_user.books.where(genre: '生活')
    books = @book_15 = current_user.books.where(genre: 'その他')
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
    if current_user.update(user_params)
      redirect_to my_page_user_path(current_user), notice: 'プロフィールが更新されました。'
    else
      flash.now[:alert] = '編集に失敗しました。'
      render :profile_edit
    end
  end

  def all_books
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.page(params[:page]).per(24).order(created_at: :desc)
  end

  # ステータス別
  def read_books
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(status: '読書済み').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def reading_books
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(status: '読書中').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def will_read_books
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(status: '未読').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def interested
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(status: '興味あり').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  # ジャンル別
  def genre_mine
  end

  def business
    @keyword = "ジャンル ： ビジネス"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: 'ビジネス').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def self_enlightenment
    @keyword = "ジャンル ： 自己啓発"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '自己啓発').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def money
    @keyword = "ジャンル ： マネー"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: 'マネー').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def politics_economy
    @keyword = "ジャンル ： 政治／経済"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '政治／経済').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def study_skill
    @keyword = "ジャンル ： 勉強／スキル"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '勉強／スキル').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def cooking
    @keyword = "ジャンル ： 料理"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '料理').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def hobby
    @keyword = "ジャンル ： 趣味"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '趣味').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def health
    @keyword = "ジャンル ： 健康"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '健康').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def sports
    @keyword = "ジャンル ： スポーツ"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: 'スポーツ').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def entertainment
    @keyword = "ジャンル ： 芸能"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '芸能').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def parenting
    @keyword = "ジャンル ： 子育て"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '子育て').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def novel
    @keyword = "ジャンル ： 小説"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '小説').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def comic
    @keyword = "ジャンル ： 漫画"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '漫画').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def life
    @keyword = "ジャンル ： 生活"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: '生活').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def genre_etc
    @keyword = "ジャンル ： その他"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(genre: 'その他').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def evaluation_mine
    books = @book = Book.where(user_id: params[:id]).all
    @book_1 = current_user.books.where(evaluation: '⭐️⭐️⭐️⭐️⭐️').page(params[:page]).per(12).order(created_at: :desc)
    @book_1 = current_user.books.where(evaluation: '⭐️⭐️⭐️⭐️☆').page(params[:page]).per(12).order(created_at: :desc)
    @book_1 = current_user.books.where(evaluation: '⭐️⭐️⭐️☆☆').page(params[:page]).per(12).order(created_at: :desc)
    @book_1 = current_user.books.where(evaluation: '⭐️⭐️☆☆☆').page(params[:page]).per(12).order(created_at: :desc)
    @book_1 = current_user.books.where(evaluation: '⭐️☆☆☆☆').page(params[:page]).per(12).order(created_at: :desc)
  end

  # 読書媒体別
  def item_all
    @real_book = 'real_book.png'
    @e_book = 'e_book.png'
    @paper_white = 'kindle.png'
    @audio_book = 'audio_book.png'
  end

  def real_book
    @keyword = "読書媒体 ： リアル書籍"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(item: 'リアル書籍').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def e_book
    @keyword = "読書媒体 ： 電子書籍"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(item: '電子書籍').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def paper_white
    @keyword = "読書媒体 ： Paperwhite"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(item: 'Paperwhite').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def audio_book
    @keyword = "読書媒体 ： オーディオブック"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(item: 'オーディオブック').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end

  def item_etc
    @keyword = "読書媒体 ： その他"
    books = @book = Book.where(user_id: params[:id]).all
    @books = current_user.books.where(item: 'その他').page(params[:page]).per(15).order(created_at: :desc)
    @book_1 = current_user.books.where(genre: 'ビジネス')
    @book_2 = current_user.books.where(genre: '自己啓発')
    @book_3 = current_user.books.where(genre: 'マネー')
    @book_4 = current_user.books.where(genre: '政治／経済')
    @book_5 = current_user.books.where(genre: '勉強／スキル')
    @book_6 = current_user.books.where(genre: '料理')
    @book_7 = current_user.books.where(genre: '趣味')
    @book_8 = current_user.books.where(genre: '健康')
    @book_9 = current_user.books.where(genre: 'スポーツ')
    @book_10 = current_user.books.where(genre: '芸能')
    @book_11 = current_user.books.where(genre: '子育て')
    @book_12 = current_user.books.where(genre: '小説')
    @book_13 = current_user.books.where(genre: '漫画')
    @book_14 = current_user.books.where(genre: '生活')
    @book_15 = current_user.books.where(genre: 'その他')
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :birth_day, :favorite_author, :favorite_genre, :favorite_book, :introduction)
  end

  def set_user
    @user = User.find_by(params[:id]) 
  end

end
