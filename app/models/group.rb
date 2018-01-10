class Group < ApplicationRecord
  belongs_to :faculty
  has_many :students

  validates :numberg, presence: true
end
