class Reading < ApplicationRecord
  belongs_to :book

  validates :read_date, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }, allow_nil: true

  def formatted_read_date
    read_date.strftime("%d.%m.%Y") if read_date
  end
end