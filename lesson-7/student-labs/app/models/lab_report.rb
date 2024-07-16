class LabReport < ApplicationRecord
  belongs_to :user

  validates :title,
  length: {maximum: 250}

  validates :description,
  length: {maximum: 500}

  validates :grade,
  format: { with: /\A(A|B|C|D|E|FX|F)\z/, 
  message: "grade is incorrect"}
end
