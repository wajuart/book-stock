class HomeController < ApplicationController
  # before_action :redirect_root

  def index; end
  def app_description; end

  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

end
