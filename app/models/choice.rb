class Choice < ApplicationRecord
  belongs_to :category
  belongs_to :city
  has_many :decisions
end
