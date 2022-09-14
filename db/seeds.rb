Movie.destroy_all

Movie.create!([{
  title: "Avatar",
  length_in_minutes: 162
},
{
  title: "Titanic",
  length_in_minutes: 194
},
{
  title: "Gladiator",
  length_in_minutes: 155
}])

p "Successfully created #{Movie.count} Movies"

if Rails.env == "development"
  User.destroy_all

  User.create!([{
    email: "customer@cinema.com",
    password: "123456",
    role: "customer"
  }, {
    email: "manager@cinema.com",
    password: "123456",
    role: "manager"
  }])

  p "Successfully created #{User.count} Users"
end
