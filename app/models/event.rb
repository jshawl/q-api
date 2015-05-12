class Event < ActiveRecord::Base
  belongs_to :task

  def as_json(options={})
    super.as_json(options).merge({user_email: get_user_email})
  end

  def get_user_email
    User.find( self.user_id ).email
  end

end