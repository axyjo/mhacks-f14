class Review < ActiveRecord::Base
  belongs_to :publication
  belongs_to :user

  validate :author_is_not_reviewer

  def author_is_not_reviewer
    if self.user == self.publication.user
      errors.add(:user, 'cannot be the author of the publication')
    end
  end
end
