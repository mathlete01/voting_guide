class Category < ApplicationRecord
    has_many :choices, dependent: :destroy
end
