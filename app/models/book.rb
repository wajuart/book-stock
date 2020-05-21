class Book < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  def self.search(search)
    return Book.all unless search
    Book.where('title LIKE(?)', "%#{search}%")
  end

  validates :title, :author, :status, :genre, presence: true, unless: :image?

  enum status: {
    "-- 選択して下さい --": 0,
    read_books: 1,
    reading_books: 2,
    will_read_books: 3,
    interested:4
  }, _prefix: true

  enum genre: {
    "-- 選択して下さい --": 0,
    business: 1,
    self_enlightenment: 2,
    money: 3,
    politics_economy: 4,
    study_skill: 5,
    cooking: 6,
    hobby: 7,
    health: 8,
    sports: 9,
    parenting: 10,
    novel: 11,
    comic: 12,
    life: 13,
    etc: 14
  }, _prefix: true

  enum item: {
    "-- 選択して下さい --": 0,
    リアル本: 1,
    電子書籍: 2,
    Paperwhite: 3,
    その他: 4
  }, _prefix: true  






  mount_uploader :image, ImageUploader
end
