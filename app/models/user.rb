class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.guest
    find_or_create_by!(name: 'Test', email: 'guest_bs6@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
         
  validates :name, length: { maximum: 10, message: "は 10文字以下で入力してください" }, presence: true
  validates :email, presence: true
  validates :favorite_author, length: { maximum: 15, message: "は 15文字以下で入力してください" }, allow_blank: true
  validates :favorite_author, length: { maximum: 15, message: "は 15文字以下で入力してください" }, allow_blank: true
  validates :favorite_genre, length: { maximum: 15, message: "は 15文字以下で入力してください" }, allow_blank: true
  validates :favorite_book, length: { maximum: 15, message: "は 15文字以下で入力してください" }, allow_blank: true
  validates :introduction, length: { maximum: 280, message: "は 280文字以下で入力してください" }, allow_blank: true

  mount_uploader :user_image, ImageUploader

end
