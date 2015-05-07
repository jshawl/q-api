u = User.first

Group.destroy_all
groups = u.groups.create([
  { name: "GA" },
  { name: "Todd Farm"}
])

Task.destroy_all
Task.create([
  { name: "Dishes", group_id: groups[1].id },
  { name: "Recycling", group_id: groups[1].id },
  { name: "Grade Homework", group_id: groups[0].id }
])

