class Financing < ApplicationRecord
  belongs_to :faculty
  belongs_to :scholarship_period
  belongs_to :type_scholarship

  validates :name_financing, presence: true
  validates :suum, presence: true
  validates :faculty, presence: true
  validates :scholarship_period, presence: true
  validates :type_scholarship_id, presence: true

end
