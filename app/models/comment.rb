class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :book, foreign_key: :book_id
end
