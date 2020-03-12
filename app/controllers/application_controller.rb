class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def index
    if logged_in?
      @micropost = current_user.microposts.build  # form_with 用
      @microposts = current_user.microposts.order(id: :desc).page(params[:page])
    end
  end
  
 private
  
   def require_user_logged_in
     unless logged_in?
        redirect_to login_url
     end
   end

  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_likes = user.likes.count    #あるユーザがお気に入りにした投稿の数
  end
  
  def counts2(microposts)
    @count_rev_microposts = microposts.rev_microposts.count    #ある投稿をお気に入りにしたユーザの数
  end
end
  

