class User < ApplicationRecord
  has_many :lab_report

  validates :email, 
  presence: true, 
  uniqueness: true,
  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
  message: "email is incorrect"},
  length: {maximum: 150}

  validates :first_name,
  presence: true,
  length: {maximum: 100}
  
  validates :last_name,
  presence: true,
  length: {maximum: 100}
end