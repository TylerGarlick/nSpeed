class RemoveSeededRoles < ActiveRecord::Migration
  def up
    Role.where(name: "Company Admin").first.destroy
    Role.where(name: "Super Admin").first.destroy
  end

  def down
    Role.delete_all
    company_admin = Role.create!(name: "Company Admin", active: true)
    super_admin = Role.create!(name: "Super Admin", active: true)
  end
end
