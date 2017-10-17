class OrderLine < ApplicationRecord
  belongs_to :student
  belongs_to :order
  belongs_to :scholarship_period
  belongs_to :type_scholarship

  validates :begin_date, presence: true
  validates :end_date, presence: true
  validates :scholarship, presence: true
  validates :student, presence: true
  validates :order, presence: true
  validates :scholarship_period, presence: true
  validates :type_scholarship, presence: true

end
