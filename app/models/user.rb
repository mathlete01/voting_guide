class User < ApplicationRecord
  #has_secure_password
  belongs_to :city
  has_many :decisions, dependent: :destroy
  has_many :choices, through: :decisions
end
