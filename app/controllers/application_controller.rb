class ApplicationController < ActionController::Base
<<<<<<< Updated upstream
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
=======
    before_action :configure_permitted_parameters, if: :devise_controller?


    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
    end
>>>>>>> Stashed changes
end
