class UsersController < Devise::RegistrationsController

  def create
    super
  end

  def show
    @user = User.find params[:id]
    if @user.provider == "google_oauth2" && @user.image_omniauth.present?
      @image = @user.image_omniauth
    elsif @user.image.present?
      @image = @user.image
    else
      @image = '/assets/default_avatar.png'
    end
    @user_public_feeds = @user.feeds.where("show_on_profile = true") # returns array
    @user_private_feeds = @user.feeds.where("show_on_profile = false") # returns array
  end

end
