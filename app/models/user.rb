class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :publications
  has_many :reviews
  has_many :charges

  validates_presence_of :first_name
  validates_presence_of :last_name
end
