class Group < ActiveRecord::Base
  has_many :groupings
  has_many :groups, through: :groupings
  has_many :tasks
end