class Faculty < ApplicationRecord
  has_many :groups
  has_many :financings
  has_many :students

  validates :namef, presence: true
end
