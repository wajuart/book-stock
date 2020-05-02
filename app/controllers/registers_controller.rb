class RegistersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, only: [:show]

  def index
    # @register = Register.new
    # @registers = @user.registers.includes(:user)
  end

  def new
  end  

  def create
    @register = @user.registers.new(register_params)
    if @register.save
      redirect_to user_registers_path(@user), notice: '本が登録されました。'
    else
      @registers = @user.registers.includes(:user)
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

  def register_params
    params.require(:register).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_user
    # @user = User.find(params[:user_id])
  end

end
