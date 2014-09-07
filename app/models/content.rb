class Content < ActiveRecord::Base
  include PgSearch

  belongs_to :publication
end
