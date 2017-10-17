class Financing < ApplicationRecord
  belongs_to :faculty
  belongs_to :scholarship_period
  belongs_to :types_scholaship

  validates :name_financing, presence: true
  validates :suum, presence: true
  validates :faculty, presence: true
  validates :scholarship_period, presence: true
  validates :type_scholarship, presence: true

end
