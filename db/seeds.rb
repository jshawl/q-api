u = User.create!(email:"j@j.com", authentication_token:"kUZY98qFsbDimxR14Qzn", password: "12345678")

Group.destroy_all
groups = u.groups.create([
  { name: "GA" },
  { name: "Todd Farm"}
])

Task.destroy_all
groups[0].tasks.create( { name: "Dishes"})
groups[0].tasks.create( { name: "Recycling"})
groups[1].tasks.create( { name: "Grade Homework"})

