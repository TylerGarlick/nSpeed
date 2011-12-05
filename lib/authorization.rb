module Authorization
  
  module User
    def is_super_admin?
      user_type == :super_admin
    end

    def is_company_admin?(company)
      (user_type == :company_admin) && (self.company == company)
    end

    def is_super_or_company_admin?(company)
      is_super_admin? || is_company_admin?(company)
    end
  end

  def is_super_admin?
    current_user.is_super_admin?
  end

  def is_company_admin?(company)
    current_user.is_company_admin?(company)
  end

  def is_super_or_company_admin?(company)
    current_user.is_super_or_company_admin?(company)
  end
end