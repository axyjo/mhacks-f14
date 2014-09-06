class Campaign < ActiveRecord::Base
  belongs_to :publication
  has_many :rewards
end
