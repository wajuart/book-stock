class UsersController < ApplicationController
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    @user.image = "default_icon.png"
    if @user.save
      flash[:success] = '新しいユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # @user = User.where(user_id: current_user.id)
  end

  def my_page
    @user = User.find(params[:id])
    # @user = User.where(user_id: current_user.id)
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
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :birth_day, :favorite_auther, :favorite_genre, :favorite_book, :introduction)
  end

#   def index
#     return nil if params[:keyword] == ""
#     @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
#     respond_to do |format|
#       format.html
#   end
# end 


end
