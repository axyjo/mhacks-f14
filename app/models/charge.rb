class Charge < ActiveRecord::Base
  belongs_to :reward
  belongs_to :user
end
