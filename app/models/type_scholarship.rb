class TypeScholarship < ApplicationRecord
  has_many :finansings
  has_many :order_lines

  validates :name_financing, presence: true
  validates :typescholarship, presence: true
end
