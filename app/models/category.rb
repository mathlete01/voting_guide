class Category < ApplicationRecord
    has_many :choices, dependent: :destroy
    has_many :decisions, dependent: :destroy
end
