class Group < ApplicationRecord
  has_many :faculties
  has_many :students

  validates :numberg, presence: true
end
