class Task < ActiveRecord::Base
  belongs_to :group
  has_many :events
  validates :name, presence: true
  def next_user 
    last_user = self.events.last.user
    data = {
      last_user: last_user, 
      users: self.group.users, 
      index: self.group.users.index(last_user),
      length: self.group.users.length
    }
    if data[:index] + 1 == data[:length]
      next_user = self.group.users[0]
    else
      next_index = self.group.users.index(@event.user) + 1
      next_user = self.group.users[ next_index ]
    end
    data[:next_user] = next_user
    return data
  end
end