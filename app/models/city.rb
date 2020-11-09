class City < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :choices, dependent: :destroy
end
