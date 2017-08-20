class Comment < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :post
  belongs_to :user

  validate :first_comment

  def first_comment
    if post.comments.count == 0 && post.user_id == user_id
      errors.add(:base, "İlk yorumu kendiniz yapamazsınız!")
    end
  end
end
