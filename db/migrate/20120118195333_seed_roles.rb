class SeedRoles < ActiveRecord::Migration
  def up
    Role.delete_all
    company_admin = Role.create!(name: "Company Admin", active: true)
    super_admin = Role.create!(name: "Super Admin", active: true)
  end

  def down
    Role.where(name: "Company Admin").first.destroy
    Role.where(name: "Super Admin").first.destroy
  end
end
