User.destroy_all
u = User.create!(email:"j@j.com", authentication_token:"kUZY98qFsbDimxR14Qzn", password: "12345678")

Group.destroy_all
groups = u.groups.create([
  { name: "GA" },
  { name: "Todd Farm"}
])

Task.destroy_all
groups[0].tasks.create( { name: "Dishes"})
groups[0].tasks.create( { name: "Recycling"})
groups[0].tasks.create( { name: "Trash"})
groups[0].tasks.create( { name: "Clean Downstairs Bathroom"})
groups[0].tasks.create( { name: "Cut the Grass"})
groups[0].tasks.create( { name: "Tupperware"})
groups[0].tasks.create( { name: "Olive Oil"})

groups[1].tasks.create( { name: "Grade Homework"})

