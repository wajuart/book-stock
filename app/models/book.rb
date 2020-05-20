class Book < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  def self.search(search)
    return Book.all unless search
    Book.where('title LIKE(?)', "%#{search}%")
  end

  validates :title, :author, :status, :genre, presence: true, unless: :image?

  enum status: {
    "-- 選択して下さい --": 0,
    読書済み: 1,
    読書中: 2,
    未読: 3,
    興味有り:4
  }, _prefix: true

  enum genre: {
    "-- 選択して下さい --": 0,
    ビジネス: 1,
    自己啓発: 2,
    マネー: 3,
    政治／経済: 4,
    勉強／スキル: 5,
    料理: 6,
    趣味: 7,
    健康: 8,
    スポーツ: 9,
    子育て: 10,
    小説: 11,
    漫画: 12,
    生活: 13,
    その他: 14
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
