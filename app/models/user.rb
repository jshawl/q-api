class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groupings
  has_many :tokens
  has_many :events
  has_many :groups, through: :groupings
  before_create :save_token

  private
  def save_token

  end
end
