module ApplicationHelper
  def login_or_sign_up_path?
    new_user_session_path == request.fullpath ||
    new_user_registration_path == request.fullpath
  end

  def user_dashboard_path?
    dashboard_path == request.fullpath
  end
end
