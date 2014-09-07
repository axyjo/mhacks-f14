class Reward < ActiveRecord::Base
  belongs_to :publication
  has_many :charges
end
