# Global:  Document Types
DocumentType.create!(:name => "Invoice")
DocumentType.create!(:name => "Weld Map")
DocumentType.create!(:name => "Document")
DocumentType.create!(:name => "Certification")

# Company
nspeed = Company.create!(:name => 'nSpeed')

# Users
tyler = User.create!(:email => 'tjgarlick@gmail.com', :password => 'orange5', :first_name => 'Tyler', :last_name => 'Garlick', :username => 'TylerGarlick', :company => nspeed, :user_type => :super_admin)
steve = User.create!(:email => 'shallada@gmail.com', :password => 'password', :first_name => 'Steve', :last_name => 'Halladay', :username => 'SteveHalladay', :company => nspeed, :user_type => :super_admin)
rodger = User.create!(:email => 'rogerabell@gmail.com', :password => 'password', :first_name => 'Roger', :last_name => 'Bell', :username => 'RogerBell', :company => nspeed, :user_type => :super_admin)

# Project Types
project_type_nqa1 = ProjectType.create!(name: "NQA-1", company: nspeed)
mox = ProjectType.create!(name: "MOX", company: nspeed)
asme = ProjectType.create!(name: "ASME Sec. III", company: nspeed)
section_8 = ProjectType.create!(name: "Sec. VIII", company: nspeed)

# Material Statuses
MaterialStatus.create!(name: "Entered", active: true)
MaterialStatus.create!(name: "Ordered", active: true)
MaterialStatus.create!(name: "Received", active: true)

# Customers
trans_nuclear = Customer.create(name: "TransNuclear", company: nspeed)
mox = Customer.create(name: "Mox", company: nspeed)

# Projects
project_6914 = Project.create!(company: nspeed, name: "6914", description: "6914 description", is_active: true, customer: trans_nuclear, project_name: "6914", project_type: project_type_nqa1)

# Submittal Status
approved = SubmittalStatus.create!(name: "Approved", color: "#ffffff", active: true, project: project_6914)
approved_with_comments = SubmittalStatus.create!(name: "Approved with Comments", color: "#e9f500", active: true, project: project_6914)
re_submit = SubmittalStatus.create!(name: "ReSubmit", color: "#ffb0b0", active: true, project: project_6914)

# Prerequiesite
ptf = Prerequisite.create!(project: project_6914, name: "Prior to Fabrication", active: true)
ptp = Prerequisite.create!(project: project_6914, name: "Prior to Procurement", active: true)