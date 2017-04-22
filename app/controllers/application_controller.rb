class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if current_user.email != 'admin@1'
      flash[:alert] = 'You are not Admin account！'
        redirect_to root_path
    end
  end

end
