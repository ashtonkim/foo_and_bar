# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

if Admin.count < 1
  Admin.create!(
    :email => "admin@foo.bar",
    :login => "admin",
    :password => "fooandbar",
    :password_confirmation => "fooandbar"
  )
end
