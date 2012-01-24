class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def authorize_user(roles, company)
    
  end

  def is_super_admin?
    current_user.user_type == :super_admin
  end

  def is_company_admin?
    current_user.user_type == :company_admin
  end

end