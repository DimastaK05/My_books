class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre, optional: true
  has_many :readings, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true

  # Проверяем, прочитана ли книга
  def read?
    readings.any?
  end

  # Получаем последнее чтение
  def last_reading
    readings.order(created_at: :desc).first
  end
end