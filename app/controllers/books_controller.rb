class BooksController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(15)
    @books_all = Book.where(params[:id]).all
    @book = Book.new
  end

  def new
    @book = Book.new
  end  

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path(@book), notice: '本が登録されました。'
    else
      flash.now[:alert] = '本の情報を正しく入力してください。'
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
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
      redirect_to books_path(@book), notice: '本が更新されました。'
    else
      flash.now[:alert] = '編集に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    if book.destroy
      redirect_to books_path(@book), notice: '本が削除されました。'
    else
      flash.now[:alert] = '削除に失敗しました。'
      render :edit
    end
  end


  def search
    @books = Book.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(24)
    @book = Book.find_by(id: params[:id])
  end

  # ジャンル別
  def genre_all
    @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(15)
  end

  def business
    @keyword = "【 ビジネス 】"
    @books = Book.where(genre: 'ビジネス').page(params[:page]).per(15).order(created_at: :desc)
  end

  def self_enlightenment
    @keyword = "【 自己啓発 】"
    @books = Book.where(genre: '自己啓発').page(params[:page]).per(15).order(created_at: :desc)
  end

  def money
    @keyword = "【 マネー 】"
    @books = Book.where(genre: 'マネー').page(params[:page]).per(15).order(created_at: :desc)
  end

  def politics_economy
    @keyword = "【 政治／経済 】"
    @books = Book.where(genre: '政治／経済').page(params[:page]).per(15).order(created_at: :desc)
  end

  def study_skill
    @keyword = "【 勉強／スキル 】"
    @books = Book.where(genre: '勉強／スキル').page(params[:page]).per(15).order(created_at: :desc)
  end

  def cooking
    @keyword = "【 料理 】"
    @books = Book.where(genre: '料理').page(params[:page]).per(15).order(created_at: :desc)
  end

  def hobby
    @keyword = "【 趣味 】"
    @books = Book.where(genre: '趣味').page(params[:page]).per(15).order(created_at: :desc)
  end

  def health
    @keyword = "【 健康 】"
    @books = Book.where(genre: '健康').page(params[:page]).per(15).order(created_at: :desc)
  end

  def sports
    @keyword = "【 スポーツ 】"
    @books = Book.where(genre: 'スポーツ').page(params[:page]).per(15).order(created_at: :desc)
  end

  def entertainment
    @keyword = "【 芸能 】"
    @books = Book.where(genre: '芸能').page(params[:page]).per(15).order(created_at: :desc)
  end

  def parenting
    @keyword = "【 子育て 】"
    @books = Book.where(genre: '子育て').page(params[:page]).per(15).order(created_at: :desc)
  end

  def novel
    @keyword = "【 小説 】"
    @books = Book.where(genre: '小説').page(params[:page]).per(15).order(created_at: :desc)
  end

  def comic
    @keyword = "【 漫画 】"
    @books = Book.where(genre: '漫画').page(params[:page]).per(15).order(created_at: :desc)
  end

  def life
    @keyword = "【 生活 】"
    @books = Book.where(genre: '生活').page(params[:page]).per(15).order(created_at: :desc)
  end

  def genre_etc
    @keyword = "【 その他 】"
    @books = Book.where(genre: 'その他').page(params[:page]).per(15).order(created_at: :desc)
  end


  # ★評価別
  def evaluation_all
    @books = Book.includes(:user).order("created_at DESC").page(params[:page]).per(15)
  end

  def evaluation_five
    @keyword = "【 星5つ：⭐️⭐️⭐️⭐️⭐️ 】"
    @books = Book.where(evaluation: '⭐️⭐️⭐️⭐️⭐️').page(params[:page]).per(15).order(created_at: :desc)
  end

  def evaluation_four
    @keyword = "【 星4つ：⭐️⭐️⭐️⭐️☆ 】"
    @books = Book.where(evaluation: '⭐️⭐️⭐️⭐️☆').page(params[:page]).per(15).order(created_at: :desc)
  end

  def evaluation_three
    @keyword = "【 星3つ：⭐️⭐️⭐️☆☆ 】"
    @books = Book.where(evaluation: '⭐️⭐️⭐️☆☆').page(params[:page]).per(15).order(created_at: :desc)
  end

  def evaluation_two
    @keyword = "【 星2つ：⭐️⭐️☆☆☆ 】"
    @books = Book.where(evaluation: '⭐️⭐️☆☆☆').page(params[:page]).per(15).order(created_at: :desc)
  end

  def evaluation_one
    @keyword = "【 星1つ：⭐️☆☆☆☆ 】"
    @books = Book.where(evaluation: '⭐️☆☆☆☆').page(params[:page]).per(15).order(created_at: :desc)
  end

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
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

end


