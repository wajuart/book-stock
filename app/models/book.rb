class Book < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :memo
  has_many  :genre_tags,  through:  :books_genre__tags
  has_many  :status_tags,  through:  :books_status_tags

  # validates :image, :title, :author, :status, :genre, presence: true
  validates :title, :author, :status, :genre, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
