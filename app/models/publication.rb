class Publication < ActiveRecord::Base
  belongs_to :genre
  belongs_to :user
  has_many :reviews
  has_one :campaign
end
