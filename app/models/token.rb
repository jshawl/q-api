class Token < ActiveRecord::Base
  belongs_to :user
  validates :device_token, uniqueness: true
end