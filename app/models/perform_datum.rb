class PerformDatum < ApplicationRecord
  belongs_to :student
  belongs_to :scholarship_period

  validates :quantity5, presence: true
  validates :quantity4, presence: true 
  validates :quantity3, presence: true
  validates :quantity2, presence: true
  validates :student, presence: true
  validates :scholarship_period, presence: true
end
