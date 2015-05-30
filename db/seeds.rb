User.destroy_all
u = User.create!(email:"j@j.com", authentication_token:"kUZY98qFsbDimxR14Qzn", password: "12345678")
u.tokens.create(device_token:"70e473f0a9bb2685b5bea5011e3033916faa17ad68c7817e14a86314947bfede")
u2 = User.create!(email:"j@j2.com", authentication_token:"k", password: "12345678")

Group.destroy_all
groups = u.groups.create([
  { name: "Todd Farm"},
  { name: "GA" }
])
Grouping.create(group_id: groups[0].id, user_id: u2.id)



Task.destroy_all
task = groups[0].tasks.create( { name: "Dishes"})

groups[0].tasks.create( { name: "Recycling"})
groups[0].tasks.create( { name: "Trash"})
groups[0].tasks.create( { name: "Clean Downstairs Bathroom"})
groups[0].tasks.create( { name: "Cut the Grass"})
groups[0].tasks.create( { name: "Tupperware"})
groups[0].tasks.create( { name: "Olive Oil"})
groups[1].tasks.create( { name: "Grade Homework"})

Event.destroy_all
task.events.create!( user_id: u.id )
task.events.create!( user_id: u2.id )
