class ApplicationController < ActionController::Base
  helper_method :current_user
  #before_action :ensure_signup_complete, only: [:new, :create, :update, :destroy]
  # def ensure_signup_complete
  #   binding.pry
  #   # Ensure we don't go into an infinite loop
  #   return if action_name == 'finish_signup'

  #   # Redirect to the 'finish_signup' page if the user
  #   # email hasn't been verified yet
  #   if current_user && !current_user.email_verified?
  #     redirect_to finish_signup_path(current_user)
  #   end
  # end
end
