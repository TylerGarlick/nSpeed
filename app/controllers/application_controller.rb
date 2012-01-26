class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def authorize_user(company, resource, access = :read)
      unless can_access(company, resource, access)
        redirect_to root_url, notice: "You aren't authorized."
      end
  end

  def can_access(company, resource, access = :read)
    if (is_super_admin? || (is_company_admin? && (current_user.company == company)))
      result = true
    elsif (access == :read)
      result = RoleResource.find(:all, :conditions => ['role_id in (?) AND resource_id = ? AND resource_type = ?', current_user.roles.map{ |x| x.id}, resource.id, resource.class.to_s]).length <= 0

    else
      result = RoleResource.find(:all, :conditions => ['role_id in (?) AND resource_id = ? AND resource_type = ? AND mode = ?', current_user.roles.map{ |x| x.id}, resource.id, resource.class.to_s, access]).length <= 0

    end
    result
  end

  def is_super_admin?
    current_user.user_type == :super_admin
  end

  def is_company_admin?
    current_user.user_type == :company_admin
  end

end