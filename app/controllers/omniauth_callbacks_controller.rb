class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      if session[:token].present?
        @vital = VitalParameter.find_by(token: params[:token])
        @vital.update_attributes(user_id: user.id)
      end
      sign_in_and_redirect user
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except('extra')
      redirect_to new_user_registration_url
    end
  end
end
