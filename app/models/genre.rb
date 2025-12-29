class Genre < ApplicationRecord
  belongs_to :user
  has_many :books, dependent: :nullify

  validates :name, presence: true
end