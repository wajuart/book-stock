class Book < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :comments, dependent: :destroy
  
  mount_uploader :image, ImageUploader
  
  def self.search(search)
    return Book.all unless search
      Book.where('title LIKE(?)', "%#{search}%")
      .or(
        Book.where('author LIKE(?)', "%#{search}%")
      )
      .or(
        Book.where('publisher LIKE(?)', "%#{search}%")
      )
  end

  enum status: {
    読書済み: 1,
    読書中: 2,
    未読: 3,
    興味あり:4
  }, _prefix: true

  enum genre: {
    ビジネス: 1,
    自己啓発: 2,
    マネー: 3,
    政治／経済: 4,
    勉強／スキル: 5,
    料理: 6,
    趣味: 7,
    健康: 8,
    スポーツ: 9,
    芸能: 10,
    子育て: 11,
    小説: 12,
    漫画: 13,
    生活: 14,
    その他: 15
  }, _prefix: true

  enum item: {
    "-- 未登録 --": 0,
    リアル書籍: 1,
    電子書籍: 2,
    Paperwhite: 3,
    オーディオブック: 4,
    その他: 5
  }, _prefix: true

  validates :title, :status, :genre, presence: true, unless: :image?
  validates :title, length: { maximum: 18 }, presence: true
  validates :publisher, length: { maximum: 10, message: "は 10文字以下で入力してください" }, allow_blank: true
  validates :author, length: { maximum: 12, message: "は 12文字以下で入力してください" }, allow_blank: true
  validates :memo, length: { maximum: 60, message: "は 60文字以下で入力してください" }, allow_blank: true
  validates :impression, length: { maximum: 180, message: "は 180文字以下で入力してください" }, allow_blank: true
  
end
