class User < ApplicationRecord
  has_secure_password

  has_many :books, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :readings, through: :books

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true
end