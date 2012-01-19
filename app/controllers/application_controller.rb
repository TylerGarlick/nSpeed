class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def authorize_user(roles, company)
    (current_user.roles & roles).size > 0 || is_super_admin? || is_company_admin?(company) unless redirect_to root_url, notice: "You aren't authorized."
  end

  def is_super_admin?
    current_user.roles.include?(Role.find_by_name("Super Admin"))
  end

  def is_company_admin?(company)
    current_user.roles.include?(Role.find_by_name("Company Admin")) && current_user.company == company
  end
end