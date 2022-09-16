Hall.destroy_all

Hall.create!([
  {
    name: "A1",
    capacity: 20
  },
  {
    name: "B1",
    capacity: 50
  },
  {
    name: "B2",
    capacity: 50
  },
  {
    name: "B3",
    capacity: 50
  },
  {
    name: "B4",
    capacity: 50
  },
  {
    name: "C1",
    capacity: 100
  },
  {
    name: "C2",
    capacity: 100
  },
  {
    name: "C3",
    capacity: 100
  },
  {
    name: "C4",
    capacity: 100
  },
  {
    name: "D1",
    capacity: 200
  }
])

p "Successfully created #{Hall.count} Halls"

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
