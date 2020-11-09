class User < ApplicationRecord
  belongs_to :city
  has_many :decisions
  has_many :choices, through: :decisions
end
