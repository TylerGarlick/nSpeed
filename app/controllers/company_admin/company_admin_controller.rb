class CompanyAdmin::CompanyAdminController < ApplicationController

  before_filter :authorize_admin_user

  def authorize_admin_user
    unless (is_super_admin? || is_company_admin?)
      redirect_to root_url, notice: "You aren't authorized."
    end
  end


end