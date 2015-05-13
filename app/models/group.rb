class Group < ActiveRecord::Base
  has_many :groupings
  has_many :users, through: :groupings
  has_many :tasks
  validates :name, presence: true
end