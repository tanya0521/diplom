class ScholarshipPeriod < ApplicationRecord
  has_many :finansings
  has_many :order_lines
  has_many :perform_datums

  validates :begin, presence: true
  validates :end, presence: true
end
