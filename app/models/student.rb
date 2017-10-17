class Student < ApplicationRecord
  belongs_to :faculty
  belongs_to :group
  has_many :order_lines
  has_many :perform_datums

  validates :fn, presence: true
  validates :sn, presence: true
  validates :ln, presence: true
  validates :birthday, presence: true
  validates :faculty, presence: true
  validates :group, presence: true
end
