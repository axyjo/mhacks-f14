class Publication < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :description]

  belongs_to :genre
  belongs_to :user
  has_many :reviews
  has_many :rewards
  has_one :campaign

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :user
end
