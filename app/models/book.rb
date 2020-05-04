class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre_id, optional: true
  belongs_to :status_id, optional: true
  belongs_to :item_id, optional: true

  def self.search(search)
    return Book.all unless search
    Book.where('text LIKE(?)', "%#{search}%")
  end

  validates :title, :author, :status, :genre, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
