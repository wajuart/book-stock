class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_books, through: :likes, source: :book
         
  validates :name, length: { maximum: 10, message: "は 10文字以下で入力してください" }, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :favorite_author, length: { maximum: 15, message: "は 15文字以下で入力してください" }, allow_blank: true
  validates :favorite_author, length: { maximum: 15, message: "は 15文字以下で入力してください" }, allow_blank: true
  validates :favorite_genre, length: { maximum: 15, message: "は 15文字以下で入力してください" }, allow_blank: true
  validates :favorite_book, length: { maximum: 15, message: "は 15文字以下で入力してください" }, allow_blank: true
  validates :introduction, length: { maximum: 280, message: "は 280文字以下で入力してください" }, allow_blank: true

  mount_uploader :user_image, ImageUploader

end
