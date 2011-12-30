# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#nspeed
nspeed = Company.create!(:name => 'nSpeed')

#add users
tyler = User.create!(:email => 'tjgarlick@gmail.com', :password => 'orange5', :first_name => 'Tyler', :last_name => 'Garlick', :username => 'TylerGarlick', :company => nspeed, :user_type => :super_admin)
steve = User.create!(:email => 'shallada@gmail.com', :password => 'password', :first_name => 'Steve', :last_name => 'Halladay', :username => 'SteveHalladay', :company => nspeed, :user_type => :super_admin)
rodger = User.create!(:email => 'rogerabell@gmail.com', :password => 'password', :first_name => 'Roger', :last_name => 'Bell', :username => 'RogerBell', :company => nspeed, :user_type => :super_admin)

#add people
Person.create!(:first_name => 'Bob', :last_name => "Smith", :email => "bob@smith.com", :company => nspeed, :active => true)
Person.create!(:first_name => 'Matt', :last_name => "Wilson", :email => "matt@smithinghouse.com", :company => nspeed, :active => true)
