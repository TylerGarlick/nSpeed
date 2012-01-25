class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def authorize_user(roles, company)
    unless (is_super_admin? || (is_company_admin? && (current_user.company == company)) || current_user.is_in_roles?(roles))
      redirect_to root_url, notice: "You aren't authorized."
    end
  end

  def is_super_admin?
    current_user.user_type == :super_admin
  end

  def is_company_admin?
    current_user.user_type == :company_admin
  end

end