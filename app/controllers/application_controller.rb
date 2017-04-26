class ApplicationController < ActionController::Base
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '对不起, 您不是管理员！'
      redirect_to root_path
    end
  end
end
