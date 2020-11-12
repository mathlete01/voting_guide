class User < ApplicationRecord
  #has_secure_password
  #validates :username, length: { minimum: 3 }, uniqueness: true
  belongs_to :city
  has_many :decisions, dependent: :destroy
  has_many :choices, through: :decisions
end
