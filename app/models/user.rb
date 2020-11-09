class User < ApplicationRecord
  belongs_to :city
  has_many :decisions, dependent: :destroy
  has_many :choices, through: :decisions, dependent: :destroy
end
