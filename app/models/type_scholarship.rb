class TypeScholarship < ApplicationRecord
  has_many :financings
  has_many :order_lines

  validates :name_financing, presence: true
  validates :typescholarship, presence: true
end
