class Region < ApplicationRecord
    has_many :choices, dependent: :destroy
end
