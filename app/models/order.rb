class Order < ApplicationRecord
  has_many :order_lines

  validates :number, presence: true
end
