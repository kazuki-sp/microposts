class ToppagesController < ApplicationController
  def current_user
    @current_user ||= User.find_by(id:session[:user_id])
  end
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
    end
  end
end
