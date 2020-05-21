class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books
  has_many :comments
         

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 

  mount_uploader :user_image, ImageUploader

end
