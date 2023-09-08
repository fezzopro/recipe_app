class HomeController < ApplicationController
  def index
    redirect_to foods_path if user_signed_in?
  end

  def show; end
end
