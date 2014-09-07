class Content < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:title, :content]

  belongs_to :publication
end
