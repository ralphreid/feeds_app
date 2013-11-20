class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])
      # @user = User.from_omniauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        flash.notice = 'Signed in through Google!'
        # flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        sign_in_and_redirect @user #update this redirct
        # sign_in_and_redirect @user, :event => :authentication
      else
        session['devise.user_attributes'] = @user.attributes
        redirect_to new_user_registration_url
      end
  end

end