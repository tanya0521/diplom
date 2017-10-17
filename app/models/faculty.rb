class Faculty < ApplicationRecord
  belongs_to :group
  has_many :financings
  has_many :students

  validates :namef, presence: true
  validates :group, presence: true
end
