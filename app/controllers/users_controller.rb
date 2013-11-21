class UsersController < Devise::RegistrationsController

  def create
    super
  end

  def show
    @user = User.find params[:id]
    if @user.provider == "google_oauth2"
      @image = @user.image_omniauth
    else
      @image = @user.image
    end


  end

end
