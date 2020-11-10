class Decision < ApplicationRecord
  belongs_to :user
  belongs_to :choice
  belongs_to :category
end
