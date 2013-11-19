class UsersController < Devise::RegistrationsController
  # load_and_authorize_resource

  def create
    super
  end

  def show
    @user = User.find params[:id]
  end

end
