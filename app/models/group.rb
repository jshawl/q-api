class Group < ActiveRecord::Base
  has_many :groupings
  has_many :users, through: :groupings
  has_many :tasks
  validates :name, presence: true

  def as_json(options={})
    hashids = Hashids.new(ENV['hashids_salt'],3,"abcdefghijklmnopqrstuvwxyz1234567890")
    super.as_json(options).merge({invite: hashids.encode(self.id)})
  end
end