class Task < ActiveRecord::Base
  belongs_to :group
  has_many :events
  def next_user
    last_user = self.events.last.user_id
    users = self.group.users.map do |user|
      user.id
    end
    if users.index(last_user) == users.length - 1
      return users[0]
    else
      next_user = users.index(last_user) + 1
      return users[next_user]
    end
  end
end